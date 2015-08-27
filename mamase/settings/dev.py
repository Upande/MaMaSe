from .base import *


# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True
TEMPLATE_DEBUG = True

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '($px*i9j!^q9-y^-d*fe^zrb=ud4j4%-!sps@&d1@cf1(t8gpi'

MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
MEDIA_URL = '/media/'


try:
    from .local import *
except ImportError:
    pass

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'mamase', 
        'USER': 'postgres',
        'PASSWORD': 'postgres',   
        'HOST': 'localhost',
        'PORT': '5432', 
    }
}


WAGTAILSEARCH_BACKENDS = {
    'default': {
       'BACKEND': 'wagtail.wagtailsearch.backends.elasticsearch.ElasticSearch',#'wagtail.wagtailsearch.backends.elasticsearch',                                                                
        'URLS': ['http://localhost:9200/'], #,                                                                                                                         
       'INDEX': 'mamase',
       'TIMEOUT': 5,
    }
}
