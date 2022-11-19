<% ui.decorateWith("appui", "standardEmrPage") %>
<%= ui.resourceLinks() %>
<table>
    <tr>
        <th>Regimen Ex</th><th>Drugs</th><th>Adult Strength</th><th>Pediatric Strength</th>
    </tr>
    <tr>
        <td>
            <input class="form-control searchBox regimens" type="text" id="regimenInput" />
            <select class="form-control" id="selectRegimen">
                <option value=""> Select Regimen </option>
            </select>

        </td>
        <td>
            <input class="form-control searchBox" type="text" id="drugInput" />
            <select class="form-control" id="selectDrug">
                <option value=""> Select Drug </option>
            </select>

        </td>
        <td>
            <input class="form-control searchBox" type="text" id="adultInput"/>
            <select class="form-control" id="selectAdult">
                <option value=""> Select Adult Strength </option>
            </select>

        </td>
        <td>
            <input class="form-control searchBox" type="text" id="pedInput"/>
            <select class="form-control" id="selectPed">
                <option value=""> Select Pediatric Strength </option>
            </select>
        </td>
        <td colspan="4"><button class="btn btn-success" id="submit">Submit</button></td>
    </tr>
</table>
<table>
    <thead><tr>
        <th>Drug</th>
        <th>Adult Strength</th>
        <th>Pediatric Strength</th>
        <th>Action</th>
    </tr></thead>
    <tbody id="viewTable">

    </tbody>
</table>
${ ui.includeFragment("nmrsmetadata","drugmapping") }

<script type="text/javascript">
    let regimentDrugMapping = null;

    function removeMapping(mappingId){
        console.log(mappingId);
        jQuery.get({
            url: '${ui.actionLink("nmrsmetadata", "drugmapping","deleteRegimenMapping")}',
            dataType: "json",
            delay: 3600,
            data: {
                'criteria': mappingId
            }
        }).success(function (data) {
            console.log(data);
            if(data === "Success"){
                getRegimenMapping(regimentDrugMapping.regimenConceptId);
            }

        }).error(function (xhr, status, err) {
            console.log(err);
        });
    }
    function getRegimenMapping(conceptId){
        jQuery.get({
            url: '${ui.actionLink("nmrsmetadata", "drugmapping","getRegimenMapping")}',
            dataType: "json",
            delay: 3600,
            data: {
                'criteria': conceptId
            }
        }).success(function (data) {
            console.log(data);
            if(data?.drugMappingList?.length > 0){
                regimentDrugMapping = data;
                populateTable(data?.drugMappingList);
                // 0data?.drugMappingList.forEach(mappin => {
                //     drugArr.push({conceptId: k, conceptName: drugs[k]});
                //     document.querySelector('#divDrug').innerHTML += "<div id='"+k+"'>"+drugs[k]+ " &nbsp;&nbsp;&nbsp;&nbsp<span style='color: orangered; font-weight; cursor: pointer' class='delDrug'>X</span></div>" ;
                //     document.querySelectorAll('.delDrug').forEach(input => {
                //         input.addEventListener('click', function (e){
                //             drugArr = drugArr.filter(el => el.conceptId !== e.target.parentNode.id);
                //             e.target.parentNode.remove();
                //         });
                //     });
                // });
                //
                // Object.keys(adStrengths).forEach(k => {
                //     adultArray.push({conceptId: k, conceptName: adStrengths[k]});
                //     document.querySelector('#divAdult').innerHTML += "<div id='"+k+"'>"+adStrengths[k]+ " &nbsp;&nbsp;&nbsp;&nbsp<span style='color: orangered; font-weight; cursor: pointer' class='delAdult'>X</span></div>" ;
                //     document.querySelectorAll('.delAdult').forEach(input => {
                //         input.addEventListener('click', function (e){
                //             adultArray = adultArray.filter(el => el.conceptId !== e.target.parentNode.id);
                //             e.target.parentNode.remove();
                //         });
                //     });
                // });
                //
                // Object.keys(pedStrengths).forEach(k => {
                //     pedArray.push({conceptId: k, conceptName: pedStrengths[k]});
                //     document.querySelector('#divPed').innerHTML += "<div id='"+k+"'>"+pedStrengths[k]+ " &nbsp;&nbsp;&nbsp;&nbsp<span style='color: orangered; font-weight; cursor: pointer' class='delPed'>X</span></div>" ;
                //     document.querySelectorAll('.delPed').forEach(input => {
                //         input.addEventListener('click', function (e){
                //             pedArray = pedArray.filter(el => el.conceptId !== e.target.parentNode.id);
                //             e.target.parentNode.remove();
                //         });
                //     });
                // });
            }else{
                regimentDrugMapping = null;
                clearSoft()
                resetTable()
            }

        }).error(function (xhr, status, err) {
            console.log(err);
            regimentDrugMapping = null;
            resetTable()
        });
    }

    function resetTable() {
        document.querySelector("#viewTable").innerHTML = "";
    }


    function populateTable(){
        resetTable();
        if(regimentDrugMapping?.drugMappingList){
            regimentDrugMapping.drugMappingList.forEach(mapping => {
                jQuery("#viewTable").append(
                    "<tr id='"+mapping.regimenDrugMappingId+"'>" +
                    "<td>" + mapping.drugName+
                    "</td>" +
                    "<td>" +
                    (mapping.adultStrength ? mapping.adultStrength : '')  +
                    "</td>" +
                    "<td>" +
                    (mapping.pediatricStrength ? mapping.pediatricStrength : '') +
                    "</td>" +
                    "<td>" +
                    "<button style='color: darkred' onclick='removeMapping("+mapping.regimenDrugMappingId+")'>X<button>" +
                    "</td>" +
                    "</tr>"
                )
            })
        }
    }

    function saveMapping(data){
        jQuery.ajax({
            method: 'post',
            url: '/openmrs/ws/rest/v1/nmrsmetadata/drugs/new',
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data)
        }).success(function (data) {
            console.log(data);
            alert("Mapping Saved Successfully");
            clearSoft();
            getRegimenMapping(document.querySelector('#selectRegimen').value)
        }).error(function (xhr, status, err) {
            console.log(err);
        });
    }

    let timeout = 0;
    function search(e){
        let criteria = e.target.value;
        let time = 1800;
        clearTimeout(timeout);
        timeout = setTimeout(() => {
            if(criteria){
                if(e.target.classList.contains("regimens")){
                    resetTable();
                }
                jQuery.get({
                    url: '${ui.actionLink("nmrsmetadata", "drugmapping","searchConcept")}',
                    dataType: "json",
                    delay: 3600,
                    data: {
                        'criteria': criteria
                    }
                }).success(function (data) {
                    let select = e.target.parentNode.children[1];
                    let option = "<option></option>";
                    data.map(record => {
                        option += "<option value='"+record.conceptId+"'>"+record.conceptName+"</option>";
                    });
                    select.innerHTML = option;
                }).error(function (xhr, status, err) {
                    console.log(err);
                });
            }else {
                if(e.target.classList.contains("regimens")){
                    clear();
                    resetTable();
                }
            }
        }, time);
    }
    function clearSoft(){
        document.querySelector('#selectDrug').innerHTML = "<option value=''> Select Drug </option>";
        document.querySelector('#selectAdult').innerHTML = "<option value=''> Select Adult Strength </option>";
        document.querySelector('#selectPed').innerHTML = "<option value=''> Select Pediatric Strength </option>";
    }

    function clear(){
        regimentDrugMapping = null;
        document.querySelectorAll(".searchBox").forEach(input => {
            input.value = "";
        });
        document.querySelector('#selectRegimen').innerHTML = "<option value=''> Select Regimen </option>";
        document.querySelector('#selectDrug').innerHTML = "<option value=''> Select Drug </option>";
        document.querySelector('#selectAdult').innerHTML = "<option value=''> Select Adult Strength </option>";
        document.querySelector('#selectPed').innerHTML = "<option value=''> Select Pediatric Strength </option>";
    }
    jQuery(document).ready(function() {

        document.querySelector("#submit").addEventListener('click', function (){

            let regimenConceptId = document.querySelector("#selectRegimen").value;
            let drugConceptId = document.querySelector("#selectDrug").value;
            let adultStrength = document.querySelector("#selectAdult").value;
            let pediatricStrength = document.querySelector("#selectPed").value;

            if(!regimenConceptId){
                alert("Regimen must be selected")
                return;
            }

            if(!drugConceptId){
                alert("Please select drug.");
                return;
            }

            if(!adultStrength && !pediatricStrength){
                alert("Adult or Pediatric strength must be selected.");
                return;
            }
            //
            // drugArr.forEach(el => {
            //     if(drugArr[drugArr.length - 1] !== el) drugsConceptsIds += el.conceptId+","
            //     else drugsConceptsIds += el.conceptId;
            // });
            //
            // pedArray.forEach(el => {
            //     if(pedArray[pedArray.length - 1] !== el) pedStrengths += el.conceptId+",";
            //     else pedStrengths += el.conceptId
            // });
            //
            // adultArray.forEach(el => {
            //     if(adultArray[adultArray.length - 1] !== el) adStrengths += el.conceptId+",";
            //     else adStrengths += el.conceptId;
            // });

            const mapping = {
                regimenDrugMappingId: null,
                regimenConceptId: regimenConceptId,
                drugsConceptId: drugConceptId,
                pediatricStrength: pediatricStrength,
                adultStrength: adultStrength
            }
            saveMapping(mapping);
        });

        document.querySelector("#selectRegimen").addEventListener("change", (e) => {
                if(e.target.value){
                    // document.querySelector('#regimenDisplay').innerHTML = e.target.value;
                    // regimenConceptId = e.target.value;
                    getRegimenMapping(e.target.value);
                }
        });
        //
        // document.querySelector("#selectDrug").addEventListener("change", (e) => {
        //     const sel = document.querySelector("#selectDrug");
        //     const conceptId = e.target.value;
        //     const conceptName = sel.options[sel.selectedIndex].text;
        //     if(e.target.value != null){
        //         let obj = {conceptId: conceptId, conceptName:conceptName};
        //         drugArr.push(obj);
        //         document.querySelector('#divDrug').innerHTML += "<div id='"+conceptId+"'>"+conceptName+ " &nbsp;&nbsp;&nbsp;&nbsp<span style='color: orangered; font-weight; cursor: pointer' class='delDrug'>X</span></div>" ;
        //         document.querySelectorAll('.delDrug').forEach(input => {
        //         input.addEventListener('click', function (e){
        //             drugArr = drugArr.filter(el => el.conceptId !== e.target.parentNode.id);
        //                 e.target.parentNode.remove();
        //             });
        //         });
        //     }
        // });
        //
        // document.querySelector("#selectAdult").addEventListener("change", (e) => {
        //     const sel = document.querySelector("#selectAdult");
        //     const conceptId = e.target.value;
        //     const conceptName = sel.options[sel.selectedIndex].text;
        //     if(e.target.value != null){
        //         let obj = {conceptId: conceptId, conceptName:conceptName};
        //         adultArray.push(obj);
        //         document.querySelector('#divAdult').innerHTML += "<div id='"+conceptId+"'>"+conceptName+ " &nbsp;&nbsp;&nbsp;&nbsp<span style='color: orangered; font-weight; cursor: pointer' class='delAdult'>X</span></div>" ;
        //         document.querySelectorAll('.delAdult').forEach(input => {
        //             input.addEventListener('click', function (e){
        //                 adultArray = adultArray.filter(el => el.conceptId !== e.target.parentNode.id);
        //                 e.target.parentNode.remove();
        //             });
        //         });
        //     }
        // });
        //
        // document.querySelector("#selectPed").addEventListener("change", (e) => {
        //     const sel = document.querySelector("#selectPed");
        //     const conceptId = e.target.value;
        //     const conceptName = sel.options[sel.selectedIndex].text;
        //     if(e.target.value != null){
        //         let obj = {conceptId: conceptId, conceptName:conceptName};
        //         pedArray.push(obj);
        //         document.querySelector('#divPed').innerHTML += "<div id='"+conceptId+"'>"+conceptName+ " &nbsp;&nbsp;&nbsp;&nbsp<span style='color: orangered; font-weight; cursor: pointer' class='delPed'>X</span></div>" ;
        //         document.querySelectorAll('.delPed').forEach(input => {
        //             input.addEventListener('click', function (e){
        //                 pedArray = pedArray.filter(el => el.conceptId !== e.target.parentNode.id);
        //                 e.target.parentNode.remove();
        //             });
        //         });
        //     }
        // });


        document.querySelectorAll(".searchBox").forEach(input => {
            input.addEventListener("keyup", function (e){
                search(e);
           });
        });

    });
</script>