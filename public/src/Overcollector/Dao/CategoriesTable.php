<?php

namespace Overcollector\Dao;


class CategoriesTable extends Table
{

    private static $instance;

    private $fetchCategories = "
SELECT id, name, description, price_multiplier, slug
FROM categories INNER JOIN
  (VALUES (1, 1), (2, 2), (5, 3), (6, 4), (11, 5), (7, 6), (12, 7), (9, 8), (10, 9), (13, 10), (3, 11), (4, 12), (8, 13)) AS orders(category_id, ordering)
    ON category_id = categories.id
ORDER BY ordering;
";

    private $fetchCategoryById = "
SELECT id, name, description, price_multiplier, slug
FROM categories
WHERE id = $1;
";

    protected function __construct()
    {
        parent::__construct();
        pg_prepare($this->handler, "fetchCategories", $this->fetchCategories);
        pg_prepare($this->handler, "fetchCategoryById", $this->fetchCategoryById);
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function getCategories()
    {
        $response = pg_execute($this->handler, "fetchCategories", []);
        if ($response !== false) {
            $categories = [];
            while (($category = pg_fetch_assoc($response)) !== false) {
                $categories[] = $category;
            }
            return $categories;
        }
        return null;
    }

    public function getCategoryById($id)
    {
        $response = pg_execute($this->handler, "fetchCategoryById", [$id]);
        if ($response !== false && ($category = pg_fetch_assoc($response)) !== false) {
            return $category;
        }
        return null;
    }

}