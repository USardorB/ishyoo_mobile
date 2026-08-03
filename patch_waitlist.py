import json
import os

files = {
    'en.json': {
        'title': 'Are you from Navoiy?',
        'description': 'Currently, the service is only active in Navoiy city. We will launch in other regions soon.',
        'buttons': {
            'yes': 'Yes, I am from Navoiy',
            'no': 'No, I am not from Navoiy'
        }
    },
    'ru.json': {
        'title': 'Вы из Навои?',
        'description': 'В настоящее время сервис работает только в городе Навои. Скоро мы запустимся и в других регионах.',
        'buttons': {
            'yes': 'Да, я из Навои',
            'no': 'Нет, я не из Навои'
        }
    },
    'uz-KR.json': {
        'title': 'Сиз Навоийданмисиз?',
        'description': 'Ҳозирча сервис фақат Навоий шаҳрида фаолият юритмоқда. Тез орада бошқа ҳудудларда ҳам ишга туширамиз.',
        'buttons': {
            'yes': 'Ҳа, Навоийданман',
            'no': 'Йўқ, Навоийдан эмасман'
        }
    },
    'uz-LAT.json': {
        'title': 'Siz Navoiydanmisiz?',
        'description': 'Hozircha servis faqat Navoiy shahrida faoliyat yuritmoqda. Tez orada boshqa hududlarda ham ishga tushiramiz.',
        'buttons': {
            'yes': 'Ha, Navoiydanman',
            'no': 'Yo\'q, Navoiydan emasman'
        }
    }
}

for filename, data in files.items():
    path = os.path.join('assets/translations', filename)
    with open(path, 'r', encoding='utf-8') as f:
        content = json.load(f)
    
    if 'auth' in content and 'waitlistDialog' in content['auth']:
        content['auth']['waitlistDialog'] = data
            
    with open(path, 'w', encoding='utf-8') as f:
        json.dump(content, f, ensure_ascii=False, indent=2)

print("Done patching waitlist dialog translations.")
