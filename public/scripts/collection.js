$(function () {
    "use strict";

    var cosmeticsMenu = $("#cosmetics-menu");

    var importDialog = document.querySelector("#import-collection--dialog");
    if (!importDialog.showModal) {
        dialogPolyfill.registerDialog(importDialog);
    }

    // Refresh button
    cosmeticsMenu.find("button.cosmetics-menu--refresh").click(function () {
        location.reload();
    });

    // Import button
    cosmeticsMenu.find("button.cosmetics-menu--import").click(function () {
        importDialog.showModal();
    });

    $(importDialog).find("button.close").click(function () {
        importDialog.close();
    });

    $(importDialog).find("button.confirm").click(function () {
        importCollection($("#import-collection--textarea").val(), function (data) {
            if (data) {
                document.querySelector("#page-toast").MaterialSnackbar.showSnackbar({
                    message: "Collection imported!"
                });
                importDialog.close();
                setTimeout(function () {
                    location.reload();
                }, 500);
            }
            else {
                $(importDialog).find(".mdl-textfield--floating-label").addClass("is-invalid");
            }
        });
    });

    // Export button
    cosmeticsMenu.find("button.cosmetics-menu--export").click(function () {
        window.open("export.php", "_blank");
    });

    // Settings
    cosmeticsMenu.find("input[type=checkbox].setting-input").change(function () {
        saveSetting($(this).data("setting"), $(this).prop("checked"), function (data) {
            if (data) {
                cosmeticsMenu.find("button.cosmetics-menu--refresh").prop("disabled", false);
            }
            else {
                document.querySelector("#page-toast").MaterialSnackbar.showSnackbar({
                    message: "Error: Failed to update settings"
                });
            }
        });
    });


    // Cosmetics
    $("#cosmetics-table").find(".cosmetic--checkbox input[type='checkbox']").change(function () {
        saveCosmetic($(this).data("cosmetic-id"), $(this).prop("checked"), function (data) {
            if (data) {
                cosmeticsMenu.find("button.cosmetics-menu--refresh").prop("disabled", false);
            }
            else {
                document.querySelector("#page-toast").MaterialSnackbar.showSnackbar({
                    message: "Error: Failed to update collection"
                });
            }
        });
    });

    function importCollection(collectionData, f) {
        $.post(
            "import.php",
            {
                data: collectionData
            },
            function (data) {
                f(data);
            }
        );
    }

    function saveCosmetic(cosmetic, owned, f) {
        $.post(
            "cosmetics.php",
            {
                cosmetic: cosmetic,
                owned: owned
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