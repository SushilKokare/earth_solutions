


const gridOptions = {
	rowData : [
	{ make:'Tesla', model:'Model y',price:64950,electric: true },
	{make:'Ford', model:'F-Series',price:33850,electric: false },
	{make:'Toyota', model:'Corolla',price:29600,electric: false },

	],

	columnDefs:[
	{ headerName: 'Company',field : "make",filter:true },
	{ headerName : 'Model Name',field : "model", filter:true,floatingFilter: true },
	{ headerName : 'Model Price',field : "price",editable:true, valueFormatter: p => '$' + p.value.toLocaleString(),
						cellClassRules:{
							'expensive':params=>params.value>30000,
							'cheap':params=>params.value<=30000
						} },
	{ headerName : 'Is Electric',field : "electric" , editable:true,
						cellEditor:'agSelectCellEditor',
						cellEditorParams:{values:[true,false]},
						cellClassRules:{
							'electric':params=>params.value===true
						}},		
	],
	rowSelection : 'multiple',

};

const myGridElement = document.querySelector('#myGrid');

agGrid.createGrid(myGridElement,gridOptions)

