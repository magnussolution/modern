<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\web\JsExpression;
?>

<?= $this->render('../partials/main'); ?>

<head>
    <?= $this->render('../partials/title-meta', ['title' => 'Dashboard']); ?>

    <!-- jsvectormap css -->
    <link href="<?= Yii::$app->request->baseUrl ?>/libs/jsvectormap/jsvectormap.min.css" rel="stylesheet"
        type="text/css" />

    <!-- Swiper slider css -->
    <link href="<?= Yii::$app->request->baseUrl ?>/libs/swiper/swiper-bundle.min.css" rel="stylesheet"
        type="text/css" />

    <?= $this->render('../partials/head-css'); ?>

    <!-- JQX Styles and Scripts -->
    <link rel="stylesheet" href="<?= Yii::$app->request->baseUrl ?>/jqx/jqx.base.css" type="text/css" />
    <link rel="stylesheet" href="<?= Yii::$app->request->baseUrl ?>/jqx/jqx.office.css" type="text/css" />
    <script src="<?= Yii::$app->request->baseUrl ?>/jqx/jquery-2.0.0.min.js"></script>
    <script src="<?= Yii::$app->request->baseUrl ?>/jqx/jquery-1.11.1.min.js"></script>
    <script src="<?= Yii::$app->request->baseUrl ?>/jqx/jqxcore.js"></script>
    <script src="<?= Yii::$app->request->baseUrl ?>/jqx/jqxbuttons.js"></script>
    <script src="<?= Yii::$app->request->baseUrl ?>/jqx/jqxscrollbar.js"></script>
    <script src="<?= Yii::$app->request->baseUrl ?>/jqx/jqxmenu.js"></script>
    <script src="<?= Yii::$app->request->baseUrl ?>/jqx/jqxgrid.js"></script>
    <script src="<?= Yii::$app->request->baseUrl ?>/jqx/jqxgrid.sort.js"></script>
    <script src="<?= Yii::$app->request->baseUrl ?>/jqx/jqxgrid.filter.js"></script>
    <script src="<?= Yii::$app->request->baseUrl ?>/jqx/jqxgrid.selection.js"></script>
    <script src="<?= Yii::$app->request->baseUrl ?>/jqx/jqxpanel.js"></script>
    <script src="<?= Yii::$app->request->baseUrl ?>/jqx/jqxcheckbox.js"></script>
    <script src="<?= Yii::$app->request->baseUrl ?>/jqx/jqxlistbox.js"></script>
    <script src="<?= Yii::$app->request->baseUrl ?>/jqx/jqxdropdownlist.js"></script>
    <script src="<?= Yii::$app->request->baseUrl ?>/jqx/jqxdata.js"></script>
    <script src="<?= Yii::$app->request->baseUrl ?>/jqx/demos.js"></script>
    <script src="<?= Yii::$app->request->baseUrl ?>/jqx/jqxgrid.pager.js"></script>
    <script src="<?= Yii::$app->request->baseUrl ?>/jqx/jqxdropdownbutton.js"></script>
    <script type="text/javascript" src="<?= Yii::$app->request->baseUrl ?>/jqx/jqxdata.export.js"></script>
    <script type="text/javascript" src="<?= Yii::$app->request->baseUrl ?>/jqx/jqxgrid.export.js"></script>
    <script type="text/javascript" src="<?= Yii::$app->request->baseUrl ?>/jqx/jqxgrid.grouping.js"></script>
    <script type="text/javascript" src="<?= Yii::$app->request->baseUrl ?>/jqx/jqxgrid.aggregates.js"></script>
    <script type="text/javascript" src="<?= Yii::$app->request->baseUrl ?>/jqx/jqxgrid.edit.js"></script>
    <script type="text/javascript" src="<?= Yii::$app->request->baseUrl ?>/jqx/jqxinput.js"></script>
    <script type="text/javascript" src="<?= Yii::$app->request->baseUrl ?>/jqx/jqxnumberinput.js"></script>
    <script type="text/javascript" src="<?= Yii::$app->request->baseUrl ?>/jqx/jqxwindow.js"></script>



    <script>
    $(document).ready(function() {
        var localData = <?= json_encode($dataProvider) ?>;
        var source = {
            datatype: "json",
            datafields: [{
                    name: 'id',
                    map: 'id',
                    type: 'int'
                },
                {
                    name: 'provider_name',
                    map: 'provider_name',
                    type: 'string'
                },
                {
                    name: 'description',
                    map: 'description',
                    type: 'string'
                },
                {
                    name: 'credit',
                    map: 'credit',
                    type: 'number'
                },
                {
                    name: 'creationdate',
                    map: 'creationdate',
                    type: 'string'
                }, {
                    name: 'creditcontrol',
                    map: 'credit_control',
                    type: 'string'
                }
            ],
            root: "entry",
            // record: "content",
            // id:"id",
            id: {
                name: "id",
                map: "id"
            },

            localdata: localData
        };
        var listSource = [{
                label: 'ID',
                value: 'id',
                checked: true
            },
            {
                label: 'Name',
                value: 'provider_name',
                checked: true
            },
            {
                label: 'Description',
                value: 'description',
                checked: true
            },
            {
                label: 'Credit',
                value: 'credit',
                checked: true
            },
            {
                label: 'Creation Date',
                value: 'creationdate',
                checked: true
            }
        ];
        // initialize the input fields.
        $("#provider_name").jqxInput({
            theme: theme
        });
        // $("#creditcontrol").jqxInput({
        //     theme: theme
        // });
        $("#description").jqxInput({
            theme: theme
        });

        $("#provider_name").width(150);
        $("#provider_name").height(23);
        // $("#creditcontrol").width(150);
        // $("#creditcontrol").height(23);
        $("#credit").jqxNumberInput({
            spinMode: 'simple',
            symbol: '$',
            width: 150,
            min: 0,
            height: 23,
            spinButtons: true
        });
        $("#description").width(150);
        $("#description").height(23);

        var dataAdapter = new $.jqx.dataAdapter(source);
        var editrow = -1;
        var toThemeProperty = function(className) {
            return className + " " + className + "-" + theme;
        }
        var groupsrenderer = function(text, group, expanded, data) {
            if (data.groupcolumn.datafield == 'credit') {
                var number = dataAdapter.formatNumber(group, data.groupcolumn.cellsformat);
                var text = data.groupcolumn.text + ': ' + number;
                if (data.subItems.length > 0) {
                    var aggregate = this.getcolumnaggregateddata(data.groupcolumn.datafield, ['sum'], true,
                        data.subItems);
                } else {
                    var rows = new Array();
                    var getRows = function(group, rows) {
                        if (group.subGroups.length > 0) {
                            for (var i = 0; i < group.subGroups.length; i++) {
                                getRows(group.subGroups[i], rows);
                            }
                        } else {
                            for (var i = 0; i < group.subItems.length; i++) {
                                rows.push(group.subItems[i]);
                            }
                        }
                    }
                    getRows(data, rows);
                    var aggregate = this.getcolumnaggregateddata(data.groupcolumn.datafield, ['sum'], true,
                        rows);
                }

                return '<div class="' + toThemeProperty('jqx-grid-groups-row') +
                    '" style="position: absolute;"><span>' + text + ', </span>' + '<span class="' +
                    toThemeProperty('jqx-grid-groups-row-details') + '">' + "Total" + ' (' + aggregate.sum +
                    ')' + '</span></div>';
            } else {
                return '<div class="' + toThemeProperty('jqx-grid-groups-row') +
                    '" style="position: absolute;"><span>' + text + '</span>';
            }
        }
        let id;
        let creationdate;

        $("#jqxgrid").jqxGrid({
            width: '100%',
            height: '600px',
            source: dataAdapter,
            altrows: true,
            sortable: true,
            pageable: true,
            autorowheight: true,
            autoheight: true,
            filterable: true,
            groupable: true,
            groupsrenderer: groupsrenderer,
            selectionmode: 'checkbox',
            altrows: true,
            groups: [],
            ready: function() {
                // Called when the Grid is loaded. Call methods or set properties here.
            },
            columns: [{
                    text: 'ID',
                    datafield: 'id',
                    minwidth: 50
                },
                {
                    text: 'Name',
                    datafield: 'provider_name',
                    width: 250
                },
                {
                    text: 'Description',
                    datafield: 'description',
                    width: 250
                },
                {
                    text: 'Credit',
                    datafield: 'credit',
                    width: 250
                },
                {
                    text: 'Creation Date',
                    datafield: 'creationdate',
                    width: 250
                },
                {
                    text: 'Edit',
                    datafield: 'Edit',
                    columntype: 'button',
                    width: 100, // Adjust width as needed
                    pinned: true, // Fix the column on the right end
                    align: 'center',
                    cellsalign: 'center',
                    cellsrenderer: function() {
                        return "Edit";
                    },
                    buttonclick: function(row) {
                        // Open the popup window when the user clicks a button.
                        editrow = row;
                        var offset = $("#jqxgrid").offset();
                        $("#popupWindow").jqxWindow({
                            position: {
                                x: parseInt(offset.left) + 60,
                                y: parseInt(offset.top) + 60
                            }
                        });

                        // Get the clicked row's data and initialize the input fields.
                        var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', editrow);
                        $("#provider_name").val(dataRecord.provider_name);
                        $("#description").val(dataRecord.description);
                        $("#credit").jqxNumberInput({
                            decimal: dataRecord.credit
                        });
                        id = dataRecord.id,
                            creationdate = dataRecord.creationdate

                        // Show the popup window.
                        $("#popupWindow").jqxWindow('open');
                    }
                }
            ]
        });



        $("#jqxlistbox").jqxListBox({
            source: listSource,
            width: 150,
            height: 130,
            checkboxes: true
        });

        $("#jqxlistbox").on('checkChange', function(event) {
            $("#jqxgrid").jqxGrid('beginupdate');
            if (event.args.checked) {
                $("#jqxgrid").jqxGrid('showcolumn', event.args.value);
            } else {
                $("#jqxgrid").jqxGrid('hidecolumn', event.args.value);
            }
            $("#jqxgrid").jqxGrid('endupdate');
        });

        /* The code `$("#jqxDropdownButton").jqxDropDownButton({ width: 70, height: 30 });` is
        initializing a dropdown button using the jqxDropDownButton plugin. */
        // $("#jqxDropdownButton").jqxDropDownButton({
        //     width: 70,
        //     height: 30
        // });
        $("#jqxDropdownButton").on('open', function() {
            $("#jqxlistbox").jqxListBox();
        });
        // $("#print").jqxButton();

        $("#print").click(function() {
            $("#jqxgrid").jqxGrid('hidecolumn', 'Edit');

            // Export grid content
            var gridContent = $("#jqxgrid").jqxGrid('exportdata', 'html');

            // Restore the "Edit" column after exporting
            $("#jqxgrid").jqxGrid('showcolumn', 'Edit');
            var newWindow = window.open('', '', 'width=800, height=500'),
                document = newWindow.document.open(),
                pageContent =
                '<!DOCTYPE html>\n' +
                '<html>\n' +
                '<head>\n' +
                '<meta charset="utf-8" />\n' +
                '<title>jQWidgets Grid</title>\n' +
                '</head>\n' +
                '<body>\n' + gridContent + '\n</body>\n</html>';
            document.write(pageContent);
            document.close();
            newWindow.print();
        });
        $("#csvExport").click(function() {
            var grid = $("#jqxgrid");
            var columns = grid.jqxGrid('columns').records;

            // Get an array of column datafields excluding the "edit" column
            var exportColumns = columns
                .map(col => col.datafield)
                .filter(datafield => datafield !== "edit"); // Exclude "edit" column

            // Export the grid with only selected columns
            grid.jqxGrid('exportdata', 'csv', 'jqxGrid', true, null, false, exportColumns);
        });
        // initialize the popup window and buttons.
        $("#popupWindow").jqxWindow({
            width: 250,
            resizable: false,
            isModal: true,
            autoOpen: false,
            cancelButton: $("#Cancel"),
            modalOpacity: 0.01
        });

        $("#popupWindow").on('open', function() {
            $("#provider_name").jqxInput('selectAll');
        });

        $("#Cancel").jqxButton({
            theme: theme
        });
        $("#Save").jqxButton({
            theme: theme
        });

        // update the edited row when the user clicks the 'Save' button.
        $("#Save").click(function() {
            if (editrow >= 0) {
                var row = {
                    provider_name: $("#provider_name").val(),
                    description: $("#description").val(),
                    credit: parseFloat($("#credit").jqxNumberInput('decimal')),
                    id: id,
                    creationdate: creationdate
                };
                let csrfToken = $('meta[name="csrf-token"]').attr('content');

                fetch("<?= Url::to(['route/update']) ?>", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json",
                            'X-CSRF-Token': csrfToken
                        },
                        body: JSON.stringify({
                            provider_name: $("#provider_name").val(),
                            description: $("#description").val(),
                            credit: parseFloat($("#credit").jqxNumberInput('decimal')),
                            id: id,
                            creationdate: creationdate,
                            _csrf: csrfToken
                        })
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            toastr.success("Provider update successfully!");

                            var rowID = $('#jqxgrid').jqxGrid('getrowid', editrow);
                            $('#jqxgrid').jqxGrid('updaterow', rowID, row);
                            $("#popupWindow").jqxWindow('hide');
                        } else {
                            $('#login-error').text(data.message).show();
                        }
                    })
                    .catch(error => {
                        $('#login-error').text('An error occurred. Please try again.').show();
                    });


            }
        });

        $('#savenew').on('click', function() {

            let newname = $('#newname').val();
            let newcredit = $('#newcredit').val();
            let newcreditcontrol = $('#newcontrol').val();
            let newdescription = $('#newdescription').val();
            let csrfToken = $('meta[name="csrf-token"]').attr('content');

            fetch("<?= Url::to(['route/save']) ?>", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                        'X-CSRF-Token': csrfToken
                    },
                    body: JSON.stringify({
                        provider_name: newname,
                        credit: newcredit,
                        creditcontrol: newcreditcontrol,
                        description: newdescription,
                        _csrf: csrfToken
                    })
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        toastr.success("Provider created successfully!");

                        // Add new record to localdata
                        let newRecord = {
                            id: data.data, // Assuming backend returns the new ID
                            provider_name: newname,
                            credit: newcredit,
                            creditcontrol: newcreditcontrol,
                            description: newdescription,
                            creationdate: new Date().toISOString().slice(0, 19).replace('T',
                                ' ') // Current timestamp
                        };

                        localData.push(newRecord); // Append to localdata
                        $("#jqxgrid").jqxGrid('updatebounddata'); // Refresh grid

                        // Clear form fields
                        $('#newname, #newcredit, #newdescription').val('');
                        $('#newcontrol').val(2);
                    } else {
                        $('#login-error').text(data.message).show();
                    }
                })
                .catch(error => {
                    $('#login-error').text('An error occurred. Please try again.').show();
                });
        });
        $("#deleterowbutton").on('click', function() {
            let csrfToken = $('meta[name="csrf-token"]').attr('content');
            var selectedrowindex = $("#jqxgrid").jqxGrid('getselectedrowindex');
            var rowscount = $("#jqxgrid").jqxGrid('getdatainformation').rowscount;
            if (selectedrowindex >= 0 && selectedrowindex < rowscount) {
                var id = $("#jqxgrid").jqxGrid('getrowid', selectedrowindex);
                fetch("<?= Url::to(['route/delete']) ?>", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json",
                            'X-CSRF-Token': csrfToken
                        },
                        body: JSON.stringify({
                            id: id,
                            _csrf: csrfToken
                        })
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            toastr.success("Delete");
                        } else {
                            $('#login-error').text(data.message).show();
                        }
                    })
                    .catch(error => {
                        $('#login-error').text('An error occurred. Please try again.').show();
                    });
                var commit = $("#jqxgrid").jqxGrid('deleterow', id);
            }
        });
    });
    </script>
</head>

<body class="default">
    <div id="layout-wrapper">
        <?= $this->render('../partials/menu'); ?>
        <div class="main-content">
            <div class="page-content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title mb-0">Providers</h4>
                                </div>
                                <div class="card-body">
                                    <div class="provider-topbar">
                                        <!-- <div id="jqxDropdownButton" style="margin-right: 10px;">
                                            <div id="jqxlistbox"></div>
                                        </div> -->
                                        <div style="margin-right: 10px;">
                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                                data-bs-target="#signupModals"><i class=" ri-chat-new-fill
 align-bottom me-1"></i>New</button>
                                        </div>
                                        <button id="jqxDropdownButton" type="button"
                                            class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown"
                                            data-bs-auto-close="outside" aria-haspopup="false" aria-expanded="false"
                                            style="margin-right: 10px;">
                                            <i class="ri-layout-column-fill align-bottom me-1"></i>Columns
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-sm">
                                            <div id="jqxlistbox"></div>
                                        </div>
                                        <div style="margin-right: 10px;">
                                            <button id='print' type="button"
                                                class="btn btn-secondary waves-effect waves-light"><i
                                                    class="ri-printer-line align-bottom me-1"></i>Print</button>
                                        </div>
                                        <div style="margin-right: 10px;">
                                            <button ttype="button" class="btn btn-success waves-effect waves-light"
                                                id='csvExport'>Export to CSV</button>
                                        </div>
                                        <div>
                                            <button ttype="button" class="btn btn-danger waves-effect waves-light"
                                                id='deleterowbutton'>Delete</button>
                                        </div>

                                    </div>

                                    <div id="jqxWidget">

                                        <div id="jqxgrid"></div>
                                        <div style="margin-top: 30px;">
                                            <div id="cellbegineditevent"></div>
                                            <div style="margin-top: 10px;" id="cellendeditevent"></div>
                                        </div>
                                        <div id="popupWindow">
                                            <div>Edit</div>
                                            <div style="overflow: hidden;">
                                                <table>
                                                    <tr>
                                                        <td align="right">Name:</td>
                                                        <td align="left"><input id="provider_name" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">description:</td>
                                                        <td align="left"><input id="description" /></td>
                                                    </tr>

                                                    <tr>
                                                        <td align="right">credit:</td>
                                                        <td align="left">
                                                            <div id="credit"></div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"></td>
                                                        <td style="padding-top: 10px;" align="right"><input
                                                                style="margin-right: 5px;" type="button" id="Save"
                                                                value="Save" /><input id="Cancel" type="button"
                                                                value="Cancel" /></td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <?= $this->render('../partials/footer'); ?>
        </div>
    </div>
    <div id="signupModals" class="modal fade" tabindex="-1" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border-0 overflow-hidden">
                <div class="modal-header p-3">
                    <h4 class="card-title mb-0">Create Provider</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label for="fullName" class="form-label">Name</label>
                            <input type="text" class="form-control" id="newname" placeholder="Enter your name">
                        </div>
                        <div class="mb-3">
                            <label for="emailInput" class="form-label">Credit</label>
                            <div class="input-group mb-3">
                                <span class="input-group-text">$</span>
                                <span class="input-group-text">0.00</span>
                                <input type="text" id="newcredit" class="form-control"
                                    aria-label="Dollar amount (with dot and two decimal places)">
                            </div>

                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Credit Control</label>
                            <select class="form-select mb-3" id="newcontrol" aria-label="Default select example">
                                <option value="2" selected>No </option>
                                <option value="1">Yes</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlTextarea5" class="form-label">Description</label>
                            <textarea class="form-control" id="newdescription" rows="3" required></textarea>
                        </div>

                        <div id="createbtn" class="text-end">
                            <button type="button" id="savenew" data-bs-dismiss="modal"
                                class="btn btn-primary">Create</button>
                        </div>
                    </form>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
    <?= $this->render('../partials/customizer'); ?>
    <?= $this->render('../partials/vendor-scripts'); ?>
    <script src="<?= Yii::$app->request->baseUrl ?>/js/app.js"></script>

</body>

</html>