<?php

namespace Overcollector\Dao;


use Overcollector\WishlistItem;

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

    private static function parseWishlistItem($row)
    {
        return WishlistItem::createWishlistItem(
            CosmeticsTable::getInstance()->getCosmeticById($row["cosmetic_id"]),
            boolval($row["favorite"])
        );
    }

    public function getWishlistByUserId($userId)
    {
        $response = pg_execute($this->handler, "fetchWishlistByUserId", array($userId));
        if ($response !== false) {
            $items = [];
            while (($row = pg_fetch_assoc($response)) !== false) {
                $items[] = $this->parseWishlistItem($row);
            }
            return $items;
        }
        return [];
    }

}