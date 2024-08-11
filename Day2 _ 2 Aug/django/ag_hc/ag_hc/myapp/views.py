from django.shortcuts import render
from django.http import HttpResponse
from .models import ag_table
import json
import pandas as pd

# Create your views here.


def index(response):
    # data = ag_table.objects.all()
    data = list(ag_table.objects.values())
        
    model_list = [item.get('model') for item in data]
    price_list = [item.get('price') for item in data]

    context = {
        'data' : json.dumps(data),
        'model_list' :json.dumps(model_list),
        'price_list' :json.dumps(price_list)
    }


    return render(response,'myapp/index.html',context)




# def index(response):
#     # data = list(ag_table.objects.values())
#     print('*'*20)
#     # print(json.dumps(ag_table.objects.values()))
    
#     data = pd.DataFrame(ag_table.objects.values('_make','_price'))
#     # df_json = data.to_json(orient='records')
#     # context = {
#     #     # 'data' : json.dumps(data)
#     #     'data' : data
#     # }
#     # print(json.dumps(data))
#     # return HttpResponse('<h1>index page</h1>')
#     print(data)
#     # return render(response,'myapp/index.html',context)
#     # return HttpResponse('<h1></h1>')
#     return render(response,'myapp/index.html',{'data':data})