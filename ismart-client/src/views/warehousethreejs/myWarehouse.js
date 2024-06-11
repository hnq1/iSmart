//My Warehouse Visualizer	
const appVersion = "1.1";
var timeOutVar = null;																												//Used by Color Scale Slider and mdvScales		

var pstyle = 'background-color: #F5F6F7; border: 1px solid #dfdfdf; padding: 5px;';   												//Panel styling		

var languageIndex = 0;																												//Initially set to English(0)

var parentLayout, appLayout; 																										//Global Reference to Application Layout child to parentLayout

var appWarehouses = [{ warehouseName: "Upload..." }, { warehouseName: "CSV URLs..." }];													//Array of objects for demo and uploaded visuals

var initalBackgroundColor = "#d9dccb";
var edgeMaterial;

$(document).ready(function () {

    warehouseList.forEach(function (warehouse) {  																					//demos	

        appWarehouses.push({
            warehouseName: warehouse,
            layoutData: null,
            inventoryData: null

        });

    });

    $(document.body).css({ "margin": "0px", "position": "absolute", width: "100%", "height": "100%" });																								// https://github.com/vitmalina/w2ui/issues/105#issuecomment-17793381
    var appDiv = $(document.createElement("div"))																					// Work around: https://github.com/vitmalina/w2ui/issues/1844
        .css({ "position": "absolute", width: "100%", "height": "100%" })
        .appendTo(document.body);


    parentLayout =
        $().w2layout(
            {
                name: "parentLayout",
                box: appDiv,
                panels:
                    [
                        {
                            type: 'main', size: "100%", resizable: false, style: pstyle,
                            toolbar: {
                                items: [
                                    {
                                        type: "menu-radio", id: "warehouse", tooltip: "Select Warehouse",
                                        items: appWarehouses.map(function (appVisual, index) { return { id: index, text: appVisual.warehouseName } }),
                                        //Find index programmatically with: w2ui.parentLayout.get("main").toolbar.items.find(function(item){return item.id == "warehouse"}).selected
                                        selected: -1,
                                        lastSelected: -1,
                                        text: function (item) {
                                            return "Warehouse: " + (item.selected <= 0 ? "" : item.items[item.selected].text);
                                        }
                                    },
                                    { type: 'break' },
                                    { type: "button", id: "toggleAnalyzer", tooltip: "Show/hide Inventory Grid", text: "Toggle Inventory Grid" },
                                    { type: 'break' },
                                    { type: "button", id: "toggleVisualGrid", tooltip: "Show/hide Warehouse Layout Grid", text: "Toggle Warehouse Layout Grid" },
                                    { type: 'break' },
                                    {
                                        type: "menu-radio", id: "language", tooltip: "Select Language",
                                        items: languages.map(function (language, index) { return { id: index, text: language.text, tooltip: language.tooltip } }),
                                        //Find index programmatically with: w2ui.parentLayout.get("main").toolbar.items.find(function(item){return item.id == "warehouse"}).selected
                                        selected: languageIndex,
                                        text: function (item) {
                                            return "Language: " + item.items[item.selected].text;
                                        }
                                    },
                                    { type: 'break' },
                                    {
                                        type: "menu", id: "Help", text: fnGetTranslatedText, tooltip: "Help",
                                        items: [
                                            { id: "documentation", text: "Documentation" },
                                            { id: "quickKeys", text: "Quick Keys" },
                                            { id: "webgl", text: "WebGL" },
                                            { id: "gltf", text: "glTF" },
                                            { id: "threejs", text: "three.js" },
                                            { id: "d3js", text: "d3.js" },
                                            { id: "w2ui", text: "w2ui" },
                                            { id: "about", text: translate("About") }
                                        ]
                                    }
                                ],
                                onClick: function (event) {
                                    event.done(function () {

                                        var aTargets = event.target.split(":");
                                        if (aTargets.length == 1 && ["upload", "toggleVisualGrid", "toggleAnalyzer"].indexOf(aTargets[0]) == -1) return; //Menu, not menu item, clicked on option
                                        switch (aTargets[0]) {

                                            case "warehouse":   //Find programmatically with: w2ui.toolbar.items.find(function(item) {return item.id == "warehouse"}).selected

                                                var vDropDown = this.items.find(function (item) { return item.id == "warehouse" });
                                                var selected = vDropDown.selected;
                                                if (vDropDown.selected <= 1) {
                                                    vDropDown.selected = vDropDown.lastSelected;
                                                    vDropDown.lastSelected = selected;
                                                    switch (selected) {
                                                        case -1:
                                                        case 0:
                                                            fnGetFileUploads();
                                                            break;
                                                        case 1:
                                                            fnGetCsvUrls();
                                                            break;
                                                    } //switch
                                                } //if 
                                                else {
                                                    w2utils.lock(document.body, { spinner: true, opacity: 0 });
                                                    vDropDown.lastSelected = selected;
                                                    vDropDown.text = "Warehouse: " + vDropDown.items[selected].text;
                                                    fnShowMyWarehouseVisualizerDemo();
                                                } //else
                                                break;

                                            case "toggleVisualGrid":

                                                var mainPanel = this.owner.get("main").content;

                                                if (mainPanel.get("preview").mdvPreHideSize) {

                                                    mainPanel.sizeTo("preview", mainPanel.get("preview").mdvPreHideSize);				//Must operate on preview, not main (bug)
                                                    mainPanel.sizeTo("left", mainPanel.get("left").mdvPreHideSize);
                                                    delete mainPanel.get("preview").mdvPreHideSize;
                                                    delete mainPanel.get("left").mdvPreHideSize;										//Handling final sizing of preview

                                                } //if
                                                else {

                                                    mainPanel.get("preview").mdvPreHideSize = mainPanel.get("preview").size;
                                                    mainPanel.get("left").mdvPreHideSize = mainPanel.get("left").size;
                                                    mainPanel.sizeTo("preview", "100%");

                                                } //else

                                                break;

                                            case "toggleAnalyzer":

                                                var mainPanel = this.owner.get("main").content;

                                                if (!mainPanel.get("left").hidden)														//Handling final sizing of preview
                                                    mainPanel.get("left").mdvPreHideSize = mainPanel.get("left").size;

                                                mainPanel.toggle("left");

                                                if (!mainPanel.get("left").hidden) {													//Handling final sizing of preview

                                                    mainPanel.sizeTo("left", mainPanel.get("left").mdvPreHideSize);
                                                    delete mainPanel.get("left").mdvPreHideSize;

                                                } //if

                                                break;

                                            case "language":

                                                fnSetLanguageIndex(aTargets[1]);
                                                break;

                                            case "Help":

                                                switch (aTargets[1]) {
                                                    case "quickKeys":

                                                        var helpText = translate("HelpText1") + translate("HelpText2") + translate("HelpText3") + translate("HelpText4");
                                                        fnPopUp(document.body, translate("Help"), helpText, 3, 2.5);
                                                        break;

                                                    case "about":

                                                        fnPopUp(document.body, translate("AppTitle") + " (" + appVersion + ")", translate("AboutText"), 3, 5);
                                                        break;

                                                    case "documentation":
                                                    case "webgl":
                                                    case "gltf":
                                                    case "threejs":
                                                    case "d3js":
                                                    case "w2ui":
                                                        var links = {
                                                            "documentation": "https://github.com/MarioDelgadoSr/MyWarehouseVisualizerDoc#my-warehouse-visualizer-documentation",
                                                            "webgl": "https://en.wikipedia.org/wiki/WebGL",
                                                            "gltf": "https://www.khronos.org/gltf/",
                                                            "threejs": "https://threejs.org/",
                                                            "d3js": "https://d3js.org/",
                                                            "w2ui": "http://w2ui.com/"
                                                        };
                                                        window.open(links[aTargets[1]], "_blank");
                                                        break;

                                                } //switch
                                                break;

                                        } //switch

                                        //Display pop-up Window
                                        function fnPopUp(appContainer, title, html, wf, hf) {

                                            var width = $(appContainer).width() == 0 ? appContainer.parentElement.clientWidth : $(appContainer).width();
                                            var height = $(appContainer).height() == 0 ? appContainer.parentElement.clientHeight : $(appContainer).height();

                                            w2popup.open({
                                                title: title,
                                                body: html,
                                                buttons: '<button onclick="w2popup.close();">' + translate("PopUpClose") + '</button>',
                                                showMax: false,
                                                showClose: true,
                                                width: width / wf,
                                                height: height / hf,
                                                modal: false
                                            });
                                        } // fnPopUp	

                                    }); // event.done

                                } //onClick
                            } //toolbar
                        }  //main											

                    ], //panels
                onRender: function (event) { event.done(function (event) { fnShowMyWarehouseVisualizerDemo(); }); }
            }
        ); //parentLayout


    parentLayout.get("main").toolbar.tooltip = "top|right";																				// http://w2ui.com/web/docs/1.5/w2toolbar.tooltip
    parentLayout.render();   																											//onRender event continues with fnShowMyWarehouseVisualizerDemo()

}); //document ready
