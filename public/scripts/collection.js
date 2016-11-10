$(function () {
    'use strict';

    var cosmeticsMenu = $("#cosmetics-menu");

    // Save changes to collection
    cosmeticsMenu.find(".cosmetics-menu--update button").click(function () {
        var cosmetics = [];
        $("#cosmetics-table").find(".cosmetic--checkbox input[type='checkbox']:checked").each(function () {
            cosmetics.push($(this).data("cosmetic-id"));
        });
        $.post(
            "cosmetics.php",
            {
                cosmetics: cosmetics
            },
            function (data) {
                document.querySelector("#page-toast").MaterialSnackbar.showSnackbar({
                    message: data ? "Collection updated!" : "Error: Update failed"
                });
                if (data) {
                    setTimeout(function () {
                        location.reload();
                    }, 500);
                }
            }
        );
    });

    cosmeticsMenu.find(".setting-input, input[type=checkbox]").change(function () {
        $.post(
            "settings.php",
            {
                setting: $(this).data("setting"),
                value: $(this).prop("checked")
            },
            function (data) {
                if (data) {
                    location.reload();
                }
            }
        );
    });

}());