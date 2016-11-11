$(function () {
    'use strict';

    var cosmeticsMenu = $("#cosmetics-menu");

    cosmeticsMenu.find(".cosmetics-menu--update-save, button").click(function () {
        var cosmetics = [];
        $("#cosmetics-table").find(".cosmetic--checkbox input[type='checkbox']:checked").each(function () {
            cosmetics.push($(this).data("cosmetic-id"));
        });

        saveCollection(cosmetics,
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
        saveSetting($(this).data("setting"), $(this).prop("checked"), function (data) {
            if (data) {
                cosmeticsMenu.find(".cosmetics-menu--update-save, button").trigger("click");
            }
        })
    });

    function saveCollection(cosmetics, f) {
        $.post(
            "cosmetics.php",
            {
                cosmetics: cosmetics
            },
            function (data) {
                f(data);
            }
        );
    }

    function saveSetting(setting, value, f) {
        $.post(
            "settings.php",
            {
                setting: setting,
                value: value
            },
            function (data) {
                f(data);
            }
        );
    }

}());