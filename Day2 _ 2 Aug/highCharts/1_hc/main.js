$(function(){
	Highcharts.chart('conatiner', {
		chart : { type : 'bar'},

		title : { text : 'Fruit Consumption' },
		subtitle : { text: 'bar chart' },

		xAxis : { categories : ['Apples','Bananas','Oranges'] },

		yAxis : { title : {text : 'Fruit eaten' }},

		series : [{ name : 'Jane', data : [1,0,4] },
				  { name : 'John', data : [5,7,3] }],

		// tooltip : {enables:true},

		legend : {enabled:true,
			layout:'vertical',
			align:'right',
			verticalAlign: 'middle',
			borderWidth:1},

		});

	});
