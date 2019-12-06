$ = require('jquery');

$(document).on('turbolinks:load', function() {
    let messagePreviewTextArea = $('#message_preview_text_area');
    let messageTemplateSelector = $('#templated_email_message_template_id');

    if (!messagePreviewTextArea || !messageTemplateSelector) {
        return;
    }

    let reloadPreviewArea = function() {
        let selectedMessageTemplateId = messageTemplateSelector.children("option:selected").val();
        $.ajax({
                url: "/message_templates/" + selectedMessageTemplateId + ".json",
                dataType: 'json'
            })
            .done(function(messageTemplate) {
                messagePreviewTextArea.html(messageTemplate.body);
            });
    };

    messageTemplateSelector.change(function() {
        reloadPreviewArea();
    });

    reloadPreviewArea();
});