$(function () {
    'use strict';

    $("#update-cosmetics").click(function () {
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
                    message: data != null ? "Collection updated" : "Error: Update failed"
                });
            }
        );
    });

}());