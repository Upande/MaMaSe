
          var icon = 'https://s3.amazonaws.com/mamase/static/images/location30.png'
          var daily = []
          var monthly = []
          var raw = []
          var weather_station = "Mulot Weather"
          var weather_variable = "Rain"
          var weather_variable_id = 1
          var time_interval = "raw"
          var month = 0
          var month_text = "Jan"
          var year = 2014
          var aggr_variable = "avg"
          var chart_type = 'category'
          var id = 1
          var dt = new Date();
          var myarry = [];
          var datatype = 'raw'
          var mylist = []
          var variable_ids = []
          var monthlyData = []

          var Lat = -0.943496;
          var Lon = 35.424305;
          var Zoom = 9;
          var graph_description = 'Raw Data'

          var startdate = ""
          var enddate = ""
          var dataset = []
          var chart
          var table
          var coordinates = []
          var coordinate_names = []
          var osmlayer

          var monthly_data = [
              ["Mulot", 25, 37, 32, 31, 37, 21, 22, 23, 33, 34, 23, 26, ],
              ["Kerook", 33, 34, 23, 26, 21, 22, 23, 25, 37, 32, 31, 37, ],
              ["Govener's Camp", 21, 31, 22, 26, 25, 37, 23, 33, 34, 23, 32, 37, ],
              ["Mara Conservancy", 21, 22, 23, 33, 34, 23, 26, 25, 37, 32, 31, 37, ],
              ["Bomet", 25, 37, 32, 31, 37, 21, 22, 23, 33, 34, 23, 26, ],
              ["Narotia", 25, 37, 32, 31, 37, 21, 22, 23, 33, 34, 23, 26, ],
              ["Rekaro", 25, 37, 32, 31, 37, 21, 22, 23, 33, 34, 23, 26, ],
              ["Talek", 25, 37, 32, 31, 37, 21, 22, 23, 33, 34, 23, 26, ],
              ["Mara River", 21, 23, 33, 34, 37, 32, 31, 37, 21, 22, 23, 26, ],
          ];
          var daily_data = [
              ["Mulot", 2, 7, 12, 3, 7, 11, 20, 2, 33, 34, 23, 26, 21, 22, 23, 25, 37, 32, 31, 37, 3, 6, 31, 37, 21, 22, 23, 33, 7, 6],
              ["Kerook", 33, 34, 23, 26, 21, 11, 20, 2, 33, 34, 23, 26, 21, 22, 23, 25, 37, 32, 31, 37, 3, 6, 31, 37, 21, 22, 23, 33, 7, 6],
              ["Govener's Camp", 21, 31, 22, 26, 25, 37, 33, 34, 23, 26, 21, 11, 20, 2, 33, 34, 23, 26, 21, 22, 23, 25, 37, 32, 31, 37, 3, 6, 31, 37],
              ["Mara Conservancy", 21, 22, 23, 33, 21, 31, 22, 26, 25, 37, 33, 34, 23, 26, 21, 11, 20, 2, 33, 34, 23, 26, 21, 22, 23, 25, 37, 32, 31, 37, 34, 23, 26, 25],
              ["Bomet", 25, 37, 32, 31, 37, 21, 22, 23, 33, 21, 31, 22, 26, 25, 37, 33, 20, 2, 33, 34, 23, 26, 21, 22, 23, 25, 37, 32, 31, 21, 22, 23, 33, 34, 23, 26],
              ["Narotia", 25, 37, 32, 31, 21, 22, 23, 33, 21, 31, 22, 26, 25, 37, 33, 34, 23, 26, 21, 11, 20, 2, 33, 34, 23, 26, 21, 22, 23, 25, 37, 32, 31, 34, 23, 26],
              ["Rekaro", 21, 22, 23, 33, 21, 31, 22, 26, 25, 37, 33, 34, 23, 26, 21, 11, 20, 2, 33, 34, 23, 26, 21, 22, 23, 25, 37, 32, 31, 21, 22, 23, 33, 34, 23, 26],
              ["Talek", 25, 37, 32, 31, 37, 21, 2, 7, 12, 3, 7, 11, 20, 2, 33, 34, 23, 26, 21, 22, 23, 25, 37, 32, 31, 37, 3, 6, 31, 37, 21, 26],
              ["Mara River", 21, 2, 7, 12, 3, 7, 11, 20, 2, 33, 34, 23, 26, 21, 22, 23, 25, 37, 32, 31, 37, 3, 6, 31, 37, 21, 0, 37, 21, 22, 23, 26],
          ];
          var raw_data = [
              ["Mara Conservancy", 21, 22, 23, 33, 21, 31, 22, 26, 25, 37, 33, 34, 23, 26, 21, 11, 20, 2, 33, 34, 23, 26, 21, 22, 23, 25, 37, 32, 31, 37, 34, 23, 26, 25],
          ];
          var time1 = ['station', 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
          var xaxis = ['station', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'June', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];


          //// ----- Selet Aggregation Type
          function selectAggregation(selaggregation) {
              aggr_variable = selaggregation.value

              define_monthly_daily_data(newdata)
              plotMonthly_daily(mydata)
          }


          ////Unload data before loading new data
          function refreshAndloadData() {
              myarry = []
              newdata = [];
              pullData(id, month, year)
          }





          function refreshmap(Lon, Lat) {
            //map.clearMarkers();
            //map.removeAllFeatures();
            //map.removeLayer(osmlayer)
             // var layers = map.getLayers();
              //layers.pop();

              //map.getView().setCenter(ol.proj.transform([Lon, Lat], 'EPSG:4326', 'EPSG:3857'));
              //map.getView().setZoom(Zoom);
              loadMap(Lon, Lat)
              //createMarker(Lon, Lat)
          }





          function table2csv(oTable, exportmode, tableElm) {
              var csv = '';
              var headers = [];
              var rows = [];

              //// Get header names
              $(tableElm + ' thead').find('th').each(function() {
                  var $th = $(this);
                  var text = $th.text();
                  var header = '"' + text + '"';
                  //// headers.push(header); // original code
                  if (text != "") headers.push(header); //// actually datatables seems to copy my original headers so there ist an amount of TH cells which are empty
              });
              csv += headers.join(',') + "\n";

              //// get table data
              if (exportmode == "full") { //// total data
                  var total = oTable.fnSettings().fnRecordsTotal()
                  for (i = 0; i < total; i++) {
                      var row = oTable.fnGetData(i);
                      row = strip_tags(row);
                      rows.push(row);
                  }
              } else { //// visible rows only
                  $(tableElm + ' tbody tr:visible').each(function(index) {
                      var row = oTable.fnGetData(this);
                      row = strip_tags(row);
                      rows.push(row);
                  })
              }
              csv += rows.join("\n");

              //// if a csv div is already open, delete it
              if ($('.csv-data').length) $('.csv-data').remove();
              //// open a div with a download link
              $('body').append('<div class="csv-data"><form enctype="multipart/form-data" method="post" action="/csv.php"><textarea class="form" name="csv">' + csv + '</textarea><input type="submit" class="submit" value="Download as file" /></form></div>');

          }



          table = $('#charttable').DataTable({
	              dom: 'Bfrtip',
                      buttons: [
                          'csvHtml5',
                          'copyHtml5',
                          'excelHtml5',
                      ],
                      data: dataset,
                      columns: [{
                          title: "Station Name"
                      }, {
                          title: "Jan"
                      }, {
                          title: "Feb"
                      }, {
                          title: "Mar"
                      }, {
                          title: "Apr"
                      }, {
                          title: "May"
                      }, {
                          title: "Jun"
                      }, {
                          title: "Jul"
                      }, {
                          title: "Aug"
                      }, {
                          title: "Sep"
                      }, {
                          title: "Oct"
                      }, {
                          title: "Nov"
                      }, {
                          title: "Dec"
                      }],
                  });



          ////change station
          function selectStation(selstation) {
              weather_station = selstation.value;
              id = weather_station

              if (datatype == 'raw') {
                  refreshAndloadData(id, month, year)
              } else {
                  drawGraph_monthly_daily(id, month, year, datatype)
              }
          }





          ////change weather variable
          function weatherVariable(selweather) {
              weather_variable = selweather.value;
              weather_variable_id = selweather[selweather.selectedIndex].id;

              populateDatatables(weather_variable_id)

              if (datatype == 'raw') {
                  defineNewdata(myarry)
                  drawGraph(newdata)
              } else {
                  ////pull appropriate weather variable data
                  defineNewdata(myarry)

                  ////pull the appropriate aggregation from the array
                  define_monthly_daily_data(newdata)

                  ////plot the data

                  plotMonthly_daily(mydata)
              }
          }




          ////change month
          function selectedMonth(selmonth) {
              month = selmonth.value - 1;

              if (datatype == 'raw') {
                  refreshAndloadData(id, month, year)
              } else {
                  drawGraph_monthly_daily(id, month, year, datatype)
              }
          }






          ////change year
          function selectedYear(selyear) {
              year = selyear.value;

              if (datatype == 'raw') {
                  refreshAndloadData(id, month, year)
              } else {
                  drawGraph_monthly_daily(id, month, year, datatype)
              }


          }





          ////change time interval  
          function timeInterval(interval) {
              datatype = interval.value;
              $("#selectaggregation").prop("disabled", false).css('opacity', 1);

              if (datatype == 'monthly') {
                  ////Disable month selection if monthly data is selected
                  $("#month").prop("disabled", true).css('opacity', 0.5);

                  ////redefine start and end dates to beging n end of year
                  ////to do

              } else {
                  $("#month").prop("disabled", false).css('opacity', 1);
              }


              if (datatype == 'raw') {
                  $("#selectaggregation").prop("disabled", true).css('opacity', 0.5);

                  pullData(id,year,month)
              } else {
                  ////call data from API using time_interval
                  //// and start date, end date and  channel

                  ////pull data 
                  drawGraph_monthly_daily(id, month, year, datatype)
                      ////define plot data based on aggr and time step
                      ////define_monthly_daily_data()
              }

          }





          ////extract weather variable from myarry
          function defineNewdata() {
              for (var i = 0; i < myarry.length; i++) {
                  if (myarry[i][0] == weather_variable) {
                      ////select particular weather variable data 
                      newdata = []
                      newdata = [myarry[0], myarry[i]]

                      return newdata
                  }

              }
          }





          function getChannelCoordnates() {
              $.ajax({
                  type: 'GET',
                  url: "/mamase/channel/",
                  dataType: "json",
                  success: function(data) {
                      for (var x = 0; x < data.length; x++) {
                          coordinate_names.push(data[x].name)
                          coordinates.push([data[x].latitude, data[x].longitude])
                      }
                  }
              });
          }





          ////Get monthly data for chosen field and populate it on datatables
          function populateDatatables(selID) {
              styear = moment(startdate).startOf('year').format('YYYY-MM-DD')
              enyear = moment(startdate).endOf('year').format('YYYY-MM-DD')
              $.ajax({
                  type: 'GET',
                  url: "/mamase/api/feed/?field=" + selID + "&start=" + styear + "&end=" + enyear + "&data=monthly",
                  dataType: "json",
                  success: function(data) {
                      dataset = []
                      monthlyData = data.feed[0].monthly
                      channels = data.channel
                      for (var x = 0; x < channels.length; x++) {
                          eval('dataset.push(["' + channels[x].name + '",0,0,0,0,0,0,0,0,0,0,0,0])');
                      }

                      eval('tabledata = monthlyData.' + aggr_variable)

                      for (var i = 0; i < tabledata.length; i++) {
                          for (var j = 0; j < dataset.length; j++) {
                              if (dataset[j][0] == tabledata[i].channelfield__channel__name) {
                                  //Get the value of the month and add one since it jan is represented as 0
                                  m = moment(tabledata.timestamp, 'YYYY-MM-DD').month() + 1

                                  eval('dataset[j][m] = roundoff(tabledata[i].reading__' + aggr_variable+')')
                              }
                          }
                      }
                      datatset = dataset.join(", ")

                      table.clear().rows.add(dataset).draw();

                  }
              });
          }





          ////load existing weather variables
          function populateWeathervariables(myarry) {
              $('#weathervariables').empty() //empty weather variable list
              var myoption = ""
                  ////create a list of existing fields, e.g rain, temp, humidity etc
              mylist = []
              for (var i = 1; i < myarry.length; i++) {
                  myoption = myarry[i][0]
                  myid = variable_ids[i - 1]

                  mylist.push(myoption)

                  $('#weathervariables').append($('<option>', {
                      value: myoption,
                      text: myoption,
                      id: myid
                  }));

              }

              ////check whether current weather_variable in present in mylist
              ////if it does not, change weather_variable value to that of the first item in mylist
              var check = $.inArray(weather_variable, mylist)
              if (check == -1) {

                  var e = document.getElementById("weathervariables");

                  var strUser = e.options[e.selectedIndex].value;
                  weather_variable = strUser

              }
              ////select the appropriate text in the weather dropdown 
              var weather_text = weather_variable;
              $('#weathervariables option').filter(function() {

                  return $(this).text() == weather_text;
              }).prop('selected', true);

          }






          ////Load map
          function loadMap(Lon, Lat) {

              map = new ol.Map({
                  target: 'map',
                  view: new ol.View({
                      projection: 'EPSG:900913',
                      center: ol.proj.fromLonLat([Lon, Lat]),
                      zoom: Zoom
                  })
              });

              osmlayer = new ol.layer.Tile({
                  source: new ol.source.OSM()
              });

              map.addLayer(osmlayer);
              createMarker(Lon, Lat)
          }





          function createMarker(Lon, Lat) {
              ////define vector source
              var vectorSource = new ol.source.Vector({
                  ////create empty vector
              });

              ////create an icon and add to source vector   

              var iconFeature = new ol.Feature({
                  geometry: new
                  ol.geom.Point(ol.proj.transform([Lon, Lat], 'EPSG:4326', 'EPSG:3857')),
                  name: 'Null Island ',
                  population: 400100,
                  rainfall: 500
              });

              ////and add to source vector   
              vectorSource.addFeature(iconFeature);
              features = [vectorSource]

              ////This function will load other points to the vector
              for (var x = 0; x < coordinates.length; x++) {
                  var coordinatesource = new ol.source.Vector({});
                  var coordinateicon = new ol.Feature({
                      geometry: new
                      ol.geom.Point(ol.proj.transform(coordinates[x], 'EPSG:4326', 'EPSG:3857')),
                      name: coordinate_names[x]
                  });
                  coordinatesource.addFeature(coordinateicon);
                  features.push(coordinatesource)
              }

              ////create the icon style
              var iconStyle = new ol.style.Style({
                  image: new ol.style.Icon( /** @type {olx.style.IconOptions} */ ({
                      anchor: [0.5, 4],
                      anchorXUnits: 'fraction',
                      anchorYUnits: 'pixels',
                      opacity: 1,
                      src: icon
                  }))
              });

              ////add the feature vector to the layer vector, and apply a style to whole layer
              osmlayer = new ol.layer.Vector({
                  source: vectorSource,
                  style: iconStyle
              });

              map.addLayer(vectorLayer);
          }





          ////To add controls for depth
          function addDepthcontrols() {
              $("#controls").append("<li>list item</li>");
          }





          ////select display mode
          function selMode(modevalue) {
              var mode = modevalue.value;

              $("#controls_div").remove();
              if (mode == 'depth') {

                  addDepthcontrols()
              }
          }




          ////draw graph for monthly data
          function drawGraph() {
              ////if (newdata[1][1]){

              chart = c3.generate({
                  bindto: '#charter',
                  data: {
                      x: 'created',
                      xFormat: '%Y-%m-%d %H:%M:%S',
                      columns: newdata,
                  },
                  tooltip: {
                      grouped: false //tooltip for one graph at a time
                  },
                  axis: {
                      x: {
                          type: 'timeseries',
                          tick: {
                              count: 5,
                              format: '%Y-%m-%d',
                              fit: true

                          }
                      }
                  }
              });
          }





          function drawGraph_monthly_daily(id, month, year, datatype) {

              ////Fxn to display loading image on load
              $("#spinner").bind("ajaxSend", function() {
                  $(this).show();
              }).bind("ajaxStop", function() {
                  $(this).hide();
              }).bind("ajaxError", function() {
                  $(this).hide();
              });

              definenewdate(month, year)

              $.ajax({

                  type: 'GET',
                  url: "/mamase/api/feed/?channel=" + id + "&start=" + startdate + "&end=" + enddate + "&data=" + datatype,
                  dataType: "json",

                  success: function(data) {
                      console.log(data)
                      channel = data.channel[0]

                      Lon = channel.longitude
                      Lat = channel.latitude

                      eval('var feeds = data.feed[0].' + datatype)
                      count = feeds.count
                      sum = feeds.sum
                      avg = feeds.average
                      min = feeds.min
                      max = feeds.max
                      count_len = count.length

                      //channel_obj = Object.keys(channel); //// convert to an object
                      len = channel.fields.length; //get length of obj


                      var created = ['created']
                      myarry = [];
                      var myarry_min = []
                          ///
                      field = "";


                      for (var i = 0; i < len; i++) { //loop thru all fields

                          var fieldname = channel.fields[i].field__name ////Whereas the fields have specific names, they have labels on thingspeak. This shall be used to access data from the api e.g field1
                          var fieldlabel = channel.fields[i].name
                          var field = channel.fields[i].name
                          var fieldid = channel.fields[i].field__id
                          variable_ids.push(fieldid)
                          eval('var ' + field + ' = ["' + fieldname + '"];')

                          //field = 'field' + (1 + i),

                              ////define a variable field dynamically: for every field
                              ////define populate first array with field name, e.g "Rain"
                              //eval('var ' + field + ' = ["' + (channel.fields[i].field) + '"]');
                              //console.log(feeds)
                          
                          $('#channeldesc').html(channel.description);
                          $('#channelname').html(channel.name);

                          var count = ['count']
                          var sum = ['sum']
                          var avg = ['avg']
                          var min = ['min']
                          var max = ['max']
                          eval('var ' + field + '__count = [""]');

                          for (var j = 0; j < count_len; j++) {
                              
                              ////assign the value of the ith field to f1
                              ///Check if the item in the loop is of the same type e.g field1
                              if (fieldlabel == feeds.count[j].channelfield__name)
                              {
                                n = feeds.count[j].timestamp;

                              if (created.length <= count_len) { ////if created is shorter than myarry
                                  created.push(n)
                              }
                                eval('var count_val =' + 'feeds.count[j].' + 'reading' + '__count');
                                eval('var sum_val =' + 'feeds.sum[j].' + 'reading' + '__sum');
                                eval('var avg_val =' + 'feeds.avg[j].' + 'reading' + '__avg');
                                eval('var max_val =' + 'feeds.max[j].' + 'reading' + '__max');
                                eval('var min_val =' + 'feeds.min[j].' + 'reading' + '__min');
                                count.push(count_val)
                                sum.push(sum_val)
                                max.push(max_val)
                                min.push(min_val)
                                avg.push(avg_val)
                              }
                              //else do nothing

                          }

                          if (myarry.length == 0) {
                              myarry.push(created)
                          }
                          var combined = [count, avg, sum, max, min]
                          eval(field + '.push(combined)');

                          eval('myarry.push(' + field + ')')


                      }

                      populateWeathervariables(myarry)
                      defineNewdata(myarry)

                      define_monthly_daily_data(newdata)
                      plotMonthly_daily(mydata)

                  }
              })
          }






          //Extracts data with the appropriate aggr
          function define_monthly_daily_data(newdata) {
              for (i = 0; i < 5; i++) {

                  if (newdata[1][1][i][0] == aggr_variable) {
                      mydata = [myarry[0], newdata[1][1][i]]
                      console.log(mydata)
                      return mydata
                  }
              }


          }





          ////Fxn to plot daily and monthly data
          function plotMonthly_daily(mydata) {
              var chart = c3.generate({
                  bindto: '#charter',
                  data: {
                      x: 'created',
                      xFormat: '%Y-%m-%d %H:%M:%S',
                      columns: mydata
                  },
                  tooltip: {
                      grouped: false ////one graph at a time
                  },
                  axis: {
                      x: {
                          type: 'timeseries',
                          tick: {
                              format: '%Y-%m-%d %H'
                          }
                      }
                  }

              });
          }





          function definenewdate(month, year) {


              if (datatype == "monthly") {
                var start = moment().startOf('year').format('YYYY-MM-DD')
                var end = moment().endOf('year').format('YYYY-MM-DD')

              } else {
                var start = moment().startOf('month').format('YYYY-MM-DD')
                var end = moment().endOf('month').format('YYYY-MM-DD')


              }

              startdate = start;
              enddate = end;

              myarry = []
          }





          function drawDatatable(dataset) {


              $body = $("body");

              $(document).on({
                  ajaxStart: function() {
                      $body.addClass("loading");
                  },
                  ajaxStop: function() {
                      $body.removeClass("loading");
                  }
              });

              $(document).ready(function() {
                  

              });
          }





          ////Fxn to pull data from the API
          function pullData(id,year,month) {
              ////Fxn to display loading image on load

              $("#spinner").bind("ajaxSend", function() {
                  $(this).show();
              }).bind("ajaxStop", function() {
                  $(this).hide();
              }).bind("ajaxError", function() {
                  $(this).hide();
              });


              ////define start and end dates
              definenewdate(month, year)

              ////for testing
              ////datatype="monthly"

              ////pull data from api and (create myarry) 
              $.ajax({

                  type: 'GET',

                  url: "/mamase/api/feed/?channel=" + id + "&start=" + startdate + "&end=" + enddate + "&data=" + datatype,
                  dataType: "json",
                  success: function(data) {

                      var channel = data.channel[0]

                      try {
 		      Lon = channel.longitude
                      Lat = channel.latitude
                      } catch (err) {			  
                          console.log(err)
                          alert("no data found");
                      }

                      var feeds = data.feed

                      //channel_obj = Object.keys(channel); //// convert to an object

                      var len = channel.fields.length
                      var created = ['created']
                          ///
                      var field = "";
                      for (var i = 0; i < len; i++) { ////loop thru all fields
                          var fieldname = channel.fields[i].field__name ////Whereas the fields have specific names, they have labels on thingspeak. This shall be used to access data from the api e.g field1

                          var field = channel.fields[i].name
                          //var fieldid = channel.fields[i].id
                          var fieldid = channel.fields[i].field__id
                          variable_ids.push(fieldid)
                          eval('var ' + field + ' = ["' + fieldname + '"];')//Confilicting variables?

                          for (var j = 0; j < feeds.length; j++) {

                              var n = feeds[j].timestamp_formatted;
                              if (created.length <= feeds.length) { ////if created is not in myarry
                                  created.push(n);
                              }
                              try {
                                  eval('var f1 =' + 'feeds[j].fields.' + field);
                              } catch (err) {

                                console.log(err)
                                  var f1 = 0
                              }
                              eval(field + '.push(f1)');

                          }
                          if (myarry[0] == null) { ////if created is not in myarry
                              myarry.push(created)
                          }

                          eval('myarry.push(' + field + ')')
                              ////weather_variable="Temperature"
                      }

                      ////Disable non-existing weather Variables
                      loadMap(Lon,Lat)
                      populateWeathervariables(myarry)
                      defineNewdata(myarry)
                      drawGraph(newdata)
                      refreshmap(Lon, Lat)
                      populateDatatables(weather_variable_id)

                  },

              });
          }



          function strip_tags(html) {
              var tmp = document.createElement("div");
              tmp.innerHTML = html;
              return tmp.textContent || tmp.innerText;
          }


          function roundoff(num) 
  { return Math.round(num * 100) / 100  ;
  }


  $(document).ready(function($) {

      window.onload = function(e) {

          //// export only what is visible right now (filters & paginationapplied)
          $('#export_visible').click(function(event) {
              event.preventDefault();
              table2csv(oTable, 'visible', 'table.display');
          })





          //// export all table data
          $('#export_all').click(function(event) {
              event.preventDefault();
              table2csv(oTable, 'full', 'table.display');
          })



          ///Initialization stuff

          var asInitVals = new Array();

          //loadMap(Lon, Lat)
          getChannelCoordnates()

          $('#year option').filter(function() {

               return $(this).text() == year;
                  }).prop('selected', true);


                  ////get current date
                  var dt = new Date();

                  ////split date to year and month
                  year = dt.getFullYear();
                  month = dt.getMonth();

                  ////select the appropriate year in the year dropdown
                  $('#year option').filter(function() {

                      return $(this).text() == year;
                  }).prop('selected', true);

                  ////select the appropriate month in the month dropdown
                  $('#month option').filter(function() {

                      return $(this).val() == month + 1;
                  }).prop('selected', true);

                  ////select the appropriate timeinterval in the timeinterval dropdown    
                  $('#timeinterval option').filter(function() {

                      return $(this).val() == time_interval;
                  }).prop('selected', true);

                  ////select the appropriate aggr in the timeinterval dropdown    
                  $('#selectaggregation option').filter(function() {

                      return $(this).val() == aggr_variable;
                  }).prop('selected', true);
                  $("#selectaggregation").prop("disabled", true).css('opacity', 0.5);

                  ////select the appropriate time interval in the timeinterval dropdown   
                  $('#timeinterval option').filter(function() {

                      return $(this).val() == datatype;
                  }).prop('selected', true);


          //load data
          pullData(id,year,month)

      }
  });
