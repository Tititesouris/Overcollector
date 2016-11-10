$(function () {
    'use strict';

    var cosmeticsMenu = $("#cosmetics-menu");

    // Save changes to collection
    cosmeticsMenu.find(".cosmetics-menu--update button").click(function () {
        var cosmetics = [];
        $("#cosmetics-table").find(".cosmetic--checkbox input[type='checkbox']:checked").each(function () {
            cosmetics.push($(this).data("cosmetic-id"));
        });
        console.log(cosmetics);
        $.post(
            "cosmetics.php",
            {
                cosmetics: cosmetics
            },
            function (data) {
                document.querySelector("#page-toast").MaterialSnackbar.showSnackbar({
                    message: data != null ? "Collection updated!" : "Error: Update failed"
                });
                setTimeout(function () {
                    location.reload();
                }, 500);
            }
        );
    });

    // On toggle change all checkboxes
    cosmeticsMenu.find(".cosmetics-menu--toggle input[type=checkbox]").change(function () {
        var checkboxes = cosmeticsMenu.find(".cosmetics-menu--item-" + $(this).data("item") + " input[type=checkbox]");
        checkboxes.prop("checked", $(this).prop("checked"));
        // Update MDL
        if ($(this).prop("checked")) {
            cosmeticsMenu.find(".cosmetics-menu--item-" + $(this).data("item") + " label").addClass("is-checked");
        }
        else {
            cosmeticsMenu.find(".cosmetics-menu--item-" + $(this).data("item") + " label").removeClass("is-checked");
        }
        checkboxes.trigger("change");
    });

    // On checkbox change hide/show category/hero
    cosmeticsMenu.find(".cosmetics-menu--item input[type=checkbox]").change(function () {
        console.log("test");
        if ($(this).attr("data-category-id")) {
            $("#cosmetics-table").find(".cosmetics-table--category.category-" + $(this).data("category-id")).css("display", $(this).prop("checked") ? "table-cell" : "none");
        }
        else {
            $("#cosmetics-table").find(".cosmetics-table--body.character-" + $(this).data("hero-id")).css("display", $(this).prop("checked") ? "table-row-group" : "none");
        }
    });

}());