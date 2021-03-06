/*
 * Copyright (C) 2011 - 2013 by Eero Laukkanen, Risto Virtanen, Jussi Patana,
 * Juha Viljanen, Joona Koistinen, Pekka Rihtniemi, Mika Kekäle, Roope Hovi,
 * Mikko Valjus, Timo Lehtinen, Jaakko Harjuhahto, Jonne Viitanen, Jari Jaanto,
 * Toni Sevenius, Anssi Matti Helin, Jerome Saarinen, Markus Kere
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

// AJAX functions //

/**
 * Sends an AJAX request for adding a new cause, reads data from #causeName, #add-causeClassification-{1, 2}
 */
function addNewCause() {
    var name = $.trim($("#causeName").val());
    if (name == undefined || name == "") {
        $("#causeName").parents(".clearfix").addClass("error");
        return;
    } else {
        $("#causeName").parents(".clearfix").removeClass("error");
    }

    radmenu_fadeOut();
    $("#addcause-modal").modal('hide');

    var classify = false;

    $.post(arca.ajax.addNewCause({causeId: selectedNode.id,
                                  name: encodeURIComponent(name), classify: classify}));
}


/**
 * Sends an AJAX request for adding and classifying a new cause, reads data from #causeName,
 * #add-causeClassification-{1, 2}
 */
function addNewCauseAndClassify() {
    var name = $.trim($("#causeName").val());
    if (name == undefined || name == "") {
        $("#causeName").parents(".clearfix").addClass("error");
        return;
    } else {
        $("#causeName").parents(".clearfix").removeClass("error");
    }

    radmenu_fadeOut();
    $("#addcause-modal").modal('hide');

    var classify = true;

    $.post(arca.ajax.addNewCause({causeId: selectedNode.id,
                                     name: encodeURIComponent(name), classify: classify}));
}


/**
 * Sends an AJAX request for renaming a cause, reads data from #renamedName
 */
function renameCause() {
    var name = $.trim($("#renamedName").val());
    if (name == undefined || name == "") {
        $("#renamedName").parents(".clearfix").addClass("error");
        return;
    } else {
        $("#renamedName").parents(".clearfix").removeClass("error");
    }
    radmenu_fadeOut();
    $("#renameCause-modal").modal('hide');
    $.post(arca.ajax.renameCause({causeId: selectedNode.id, name: encodeURIComponent(name)}));
}


/**
 * Sends an AJAX request for liking a cause
 * @param selected the selected node
 */
function likeCause(selected) {
    if (arca.ownerId != arca.currentUser) {
        radmenu_fadeOut();
    }

    $.post(arca.ajax.likeCause({causeId: selected.id}), function (result) {
        selected.data.hasUserLiked = result.hasliked;
        selected.data.likeCount = result.count;
        if (arca.ownerId != arca.currentUser) {
            radmenu_updateLikeButtons(selected);
        }
    });
}


/**
 * Sends an AJAX request for disliking (unliking) a cause
 * @param selected the selected node
 */
function dislikeCause(selected) {
    if (arca.ownerId != arca.currentUser) {
        radmenu_fadeOut();
    }

    $.post(arca.ajax.dislikeCause({causeId: selected.id}), function (result) {
        selected.data.hasUserLiked = result.hasliked;
        selected.data.likeCount = result.count;
        if (arca.ownerId != arca.currentUser) {
            radmenu_updateLikeButtons(selected);
        }
    });
}


/**
 * Sends an AJAX request for adding a corrective idea
 * Reads data from #ideaName, #ideaDescription
 */
function addCorrectiveIdea() {
    var name = $("#ideaName").val();
    if (name == undefined || name == "") {
        $("#ideaName").parents(".clearfix").addClass("error");
        return;
    } else {
        $("#ideaName").parents(".clearfix").removeClass("error");
    }

    var description = $("#ideaDescription").val();
    if (description == undefined || description == "") {
        $("#ideaDescription").parents(".clearfix").addClass("error");
        return;
    } else {
        $("#ideaDescription").parents(".clearfix").removeClass("error");
    }

    $.post(
        arca.ajax.addCorrectiveIdea(
            {toId: selectedNode.id, name: name, description: description}
        ),
        function () {
            radmenu_fadeOut();
            $("#addcorrection-modal").modal('hide');
            $("#correction-help-message").show();
            $("#correction-help-message").delay(1700).fadeOut(1600, "linear");
        }
    );
}


/**
 * Sends an AJAX request for editing a classification
 * Reads data from #edit-classification{Id, Title, Type, Abbreviation, Explanation}
 * @return boolean
 */
function editClassification() {
    var id = $('#edit-classificationId').val();
    var name = $('#edit-classificationTitle').val();
    var type = $('#edit-classificationType').val();
    var abbreviation = $('#edit-classificationAbbreviation').val();
    var explanation = $('#edit-classificationExplanation').val();
    $.getJSON(
        arca.ajax.editClassification({
            classificationId: id,
            name: name,
            type: type,
            abbreviation: abbreviation,
            explanation: explanation
        })
    ).success(function (data) {
        if ("error" in data) {
            $('#editClassification-modal .error-field').text(data.error).show();
        } else {
            $('#editClassification-modal').modal('hide');
        }
    });
    return false;
}


/**
 * Sends an AJAX request for adding a new classification
 * Reads data from $classification{Name, Type, Abbreviation, Explanation}
 * @return boolean
 */
function addClassification() {
    var name = $('#classificationName').val();
    var type = $('#classificationType').val();
    var abbreviation = $('#classificationAbbreviation').val();
    var explanation = $('#classificationExplanation').val();
    $.getJSON(
        arca.ajax.addClassification({
            name: name,
            type: type,
            abbreviation: abbreviation,
            explanation: explanation
        })
    ).success(function (data) {
        if ("error" in data) {
            $('#addClassification-modal .error-field').text(data.error).show();
        } else {
            $('#addClassification-modal').modal('hide');
        }
    });
    return false;
}


/**
 * Sends an AJAX request for removing a classification
 * Reads data from #remove-classificationId
 * @return boolean
 */
function removeClassification() {
    var id = $('#remove-classificationId').val();
    $.getJSON(
        arca.ajax.removeClassification({classificationId: id}),
        function (data) {
            if ("error" in data) {
                $('#removeClassification-modal .error-field').text("Error: " + data.error).show();
            } else {
                $('#removeClassification-modal').modal('hide');
            }
        }
    );
    return false;
}


/**
 * Sends an AJAX request for (re)classifying a cause
 */
function tagCause() {
    var causeId = selectedNode.id;
    $("#" + causeId).addClass("classified");

    $.getJSON(
        arca.ajax.tagCause({causeId: causeId,
                            classifications: constructTagString()})
    ).success(function () {
        $('#tagcause-modal').modal('hide');
    });
}