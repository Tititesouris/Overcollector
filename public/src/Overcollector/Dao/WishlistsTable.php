<?php

namespace Overcollector\Dao;


class WishlistsTable extends Table
{

    private static $instance;

    private $fetchWishlistByUserId = "
SELECT user_id, cosmetic_id, favorite
FROM wishlist_items
WHERE user_id = $1;
";

    protected function __construct()
    {
        parent::__construct();
        pg_prepare($this->handler, "fetchWishlistByUserId", $this->fetchWishlistByUserId);
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function getWishlistByUserId($userId)
    {
        $response = pg_execute($this->handler, "fetchWishlistByUserId", [$userId]);
        if ($response !== false) {
            $items = [];
            while (($wishlistItem = pg_fetch_assoc($response)) !== false) {
                $items[] = $wishlistItem;
            }
            return $items;
        }
        return [];
    }

}