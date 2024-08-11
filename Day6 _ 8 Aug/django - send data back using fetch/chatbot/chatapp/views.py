from django.shortcuts import render, HttpResponse
from django.http import JsonResponse
# import psycopg2
# from psycopg2 import sql

from .models import tb_role, tb_thread, tb_history

# Create your views here.

# def getconnection():
#     dbname = 'db_chatbot'
#     user = 'postgres'
#     password = 'root'
#     host = 'localhost'
#     port = '5432'

#     conn = psycopg2.connect(
#         dbname=dbname,
#         user=user,
#         password=password,
#         host=host,
#         port=port
#     )

#     return conn


def index(response):
    return render(response,'chatapp/base.html',{})

def qna(response):
    # print('in qna function ')
    # conn = getconnection()
    # cur = conn.cursor()
    # cur.execute('select * from chatapp_tb_role')
    # for row in cur.fetchall():
    #     print(row)

    if response.method=='POST':
        _question = response.POST.get('seachbox')
        if (len(_question)==0):
            return render(response,'chatapp/role.html')
        else:
            print(_question)
            # conn = getconnection()
            # cur = conn.cursor()
            print(_question[:10])
            th = tb_thread(title=_question[:10])
            th.save()
            print(th.threadid)
            _answer = 'Reply Answer For '+str(_question)
            qn = tb_history(threadid=th.threadid,roleid=2,question=_question,answer = _answer)
            qn.save()
            print('done')
            print(tb_history.objects.all())
            context = tb_history.objects.all().order_by('msgid')
            return render(response,'chatapp/history.html',{'data':context})
    return render(response,'chatapp/base.html')
    return HttpResponse()


def qnadata(response):
    context = tb_history.objects.all().order_by('msgid')
    data = [{'question':obj.question,'answer':obj.answer} for obj in context]
    # print(type(data))
    # questions = [obj.question for obj in context  ]
    # answers = [obj.answer for obj in context  ]

    # data = {
    #     'questions' : questions,
    #     'answers' : answers
    # }
    return JsonResponse(data,safe=False)

# views.py
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json

@csrf_exempt  # Use csrf_exempt for demonstration; you should use CSRF tokens in production
def storedata(request):
    if request.method == 'POST':
        # Process the data from the request
        try:
            data = json.loads(request.body)
            text = data.get('text', '')
            print('*'*50)
            print(text)
            print('*'*50)
            th = tb_thread(title=text[:10])
            th.save()
            print(th.threadid)
            _answer = 'Reply Answer For '+str(text)
            qn = tb_history(threadid=th.threadid,roleid=2,question=text,answer = _answer)
            qn.save()
     
            # Return a JSON response
            return JsonResponse({'message': f'Received text: {text}'})
        except json.JSONDecodeError:
            return JsonResponse({'error': 'Invalid JSON'}, status=400)
    return JsonResponse({'error': 'Invalid request method'}, status=400)