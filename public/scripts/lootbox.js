$(function () {
    "use strict";

    $("input[type=checkbox].duplicate-checkbox").change(function () {
        $("select[data-lootbox='" + $(this).data("lootbox") + "']").prop("disabled", $(this).prop("checked"));
    });

    $("select.hero-select, select.type-select").change(function () {
        var lootbox = $(this).data("lootbox");
        var typeSelect = $("select.type-select[data-lootbox='" + lootbox + "']");
        var cosmeticSelect = $("select.cosmetic-select[data-lootbox='" + lootbox + "']");
        var heroId = $("select.hero-select[data-lootbox='" + lootbox + "']").find(":selected").val();
        var typeId = typeSelect.find(":selected").val();
        var selected = false;
        // Hide irrelevant types for All Heroes
        typeSelect.find("option.not-for-allheroes").each(function () {
            heroId == 0 ? $(this).hide() : $(this).show();
        });
        cosmeticSelect.prop("disabled", false);
        cosmeticSelect.find("option").each(function () {
            if ($(this).data("hero") == heroId && $(this).data("type") == typeId) {
                $(this).show();
                if (!selected) {
                    cosmeticSelect.val($(this).val());
                    selected = true;
                }
            }
            else {
                $(this).hide();
            }
        });

        // If there are no cosmetic matching this hero and type
        if (selected === false) {
            cosmeticSelect.val(-1);
            cosmeticSelect.prop("disabled", true);
        }
    });

    $("#open-lootbox-btn").click(function () {
        var cosmetics = [];
        $("select.cosmetic-select:enabled").each(function () {
            cosmetics.push(parseInt($(this).val()));
        });
        if (cosmetics.length > 0) {
            addCosmetics(cosmetics, function (data) {
                console.log(data);
                if (data == "true") {
                    document.querySelector("#page-toast").MaterialSnackbar.showSnackbar({
                        message: "Cosmetics saved!"
                    });
                    setTimeout(function () {
                        location.reload();
                    }, 500);
                }
                else {
                    document.querySelector("#page-toast").MaterialSnackbar.showSnackbar({
                        message: "Error: Failed to save cosmetics"
                    });
                }
            });
        }
    });

    function addCosmetics(cosmetics, f) {
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

})
;