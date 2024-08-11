const gridOptions = {
	rowData : [
	{ make:'Tesla', model:'Model y',price:64950,electric: true },
	{make:'Ford', model:'F-Series',price:33850,electric: false },
	{make:'Toyota', model:'Corolla',price:29600,electric: false },

	],

	columnDefs:[
	{ headerName: 'Company',field : "make" },
	{ headerName : 'Model Name',field : "model" },
	{ headerName : 'Model Price',field : "price" },
	{ headerName : 'Is Electric',field : "electric" }
	]
};

const myGridElement = document.querySelector('#myGrid');

agGrid.createGrid(myGridElement,gridOptions)

