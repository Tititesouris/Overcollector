<?php

namespace Overwatch\Dao;


use Overwatch\Category;

require_once(__DIR__ . "/Database.php");

class CategoriesTable
{

    private static $instance;

    private $handler;

    private $fetchAllCategories = "SELECT id, name, description FROM categories INNER JOIN (VALUES (1, 1), (2, 2), (5, 3), (6, 4), (7, 5), (9, 6), (3, 7), (4, 8), (8, 9)) AS orders(category_id, ordering) ON category_id = categories.id ORDER BY ordering;";

    private $fetchCategoryById = "SELECT id, name, description FROM categories WHERE id = $1;";

    private function __construct()
    {
        $this->handler = Database::getInstance()->getHandler();
        pg_prepare($this->handler, "fetchAllCategories", $this->fetchAllCategories);
        pg_prepare($this->handler, "fetchCategoryById", $this->fetchCategoryById);
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    private static function parseCategory($row)
    {
        return Category::createCategory(
            intval($row["id"]),
            $row["name"],
            $row["description"]
        );
    }

    public function getCategoryById($id)
    {
        $response = pg_execute($this->handler, "fetchCategoryById", array($id));
        if ($response !== false && ($row = pg_fetch_assoc($response)) !== false) {
            return $this->parseCategory($row);
        }
        return null;
    }

    public function getAllCategoriesOrderById()
    {
        $response = pg_execute($this->handler, "fetchAllCategories", array());
        if ($response !== false) {
            $categories = [];
            while (($row = pg_fetch_assoc($response)) !== false) {
                $category = $this->parseCategory($row);
                $categories[$category->getId()] = $category;
            }
            return $categories;
        }
        return [];
    }
}