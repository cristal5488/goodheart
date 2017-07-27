document.addEventListener("turbolinks:load", function() {
    // Build the chart
    Highcharts.chart('analytic', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'Bloodtype Analytics'
        },
        tooltip: {
            pointFormat: '{series.name}: <br/> total:<b>{point.y}</b> <br/> percentage: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: false
                },
                showInLegend: true
            }
        },
        series: [{
           name: 'Analytic',
           colorByPoint: true,
           data: JSON.parse($("#analytics_data").val())
        }]
    });

});
