$(function () {
    "use strict";

    $("#profile-save-btn").click(function () {
        $("#profile-settings").find(".setting input").each(function () {
            var setting = parseInt($(this).data("setting-id"));
            var value = $(this).val() === "on" ? $(this).prop("checked") : $(this).val();
            saveSetting(
                setting,
                value,
                function (data) {
                    if (!data) {
                        document.querySelector("#page-toast").MaterialSnackbar.showSnackbar({
                            message: "Error: Failed to update setting #" + setting + " with value " + value
                        });
                    }
                }
            );
        });
    });

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