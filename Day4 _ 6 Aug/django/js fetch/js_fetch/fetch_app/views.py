from django.shortcuts import render, HttpResponse
from django.http import JsonResponse

from django.views.decorators.csrf import csrf_exempt
# from django.http import JsonResponse
import json

# Create your views here.

def get_data(request):
	data = {'message':'Hello World!'}
	return JsonResponse(data)

@csrf_exempt
def post_data(request):
	if request.method=='POST':
		data = json.loads(request.body)
		response = {'received': data}
		return JsonResponse(response)


def index(request):
	return render(request,'fetch_app/index.html')