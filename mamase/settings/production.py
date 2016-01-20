from .base import *
import os

env = os.environ.copy()
SECRET_KEY = env['SECRET_KEY']

DEBUG = False
TEMPLATE_DEBUG = False


try:
    from .local import *
except ImportError:
    pass
# Parse database configuration from $DATABASE_URL
import dj_database_url

DATABASES = {'default': dj_database_url.config()} 

# Honor the 'X-Forwarded-Proto' header for request.is_secure()
SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')

# Allow all host headers
ALLOWED_HOSTS = ['*']

#STATICFILES_STORAGE = 'whitenoise.django.GzipManifestStaticFilesStorage'
STATICFILES_STORAGE = 'storages.backends.s3boto.S3BotoStorage'

COMPRESS_OFFLINE = True
COMPRESS_CSS_FILTERS = [
    'compressor.filters.css_default.CssAbsoluteFilter',
    'compressor.filters.cssmin.CSSMinFilter',
]
COMPRESS_CSS_HASHING_METHOD = 'content'

AWS_QUERYSTRING_AUTH = False
AWS_ACCESS_KEY_ID = os.environ['AWS_ACCESS_KEY_ID']
AWS_SECRET_ACCESS_KEY = os.environ['AWS_SECRET_ACCESS_KEY']
AWS_STORAGE_BUCKET_NAME = os.environ['S3_BUCKET_NAME']
AWS_PRELOAD_METADATA = False

AWS_S3_CUSTOM_DOMAIN = '%s.s3.amazonaws.com' % AWS_STORAGE_BUCKET_NAME

DEFAULT_FILE_STORAGE = 'storages.backends.s3boto.S3BotoStorage'
MEDIAFILES_LOCATION = 'media'
MEDIA_URL = 'https://mamase.s3.amazonaws.com/media/'

AWS_S3_CUSTOM_DOMAIN = '%s.s3.amazonaws.com' % AWS_STORAGE_BUCKET_NAME

WAGTAILSEARCH_BACKENDS = {
    'default': {
        'BACKEND': 'wagtail.wagtailsearch.backends.elasticsearch.ElasticSearch',#'wagtail.wagtailsearch.backends.elasticsearch',                                                              
        'URLS': [os.environ.get('SEARCHBOX_URL')], #,                                                                        
        'INDEX': 'mamase',
        'TIMEOUT': 5,
    }
}


SEND_BROKEN_LINK_EMAILS=True
ADMINS = (
    ('Samuel', 'samuel@upande.com'),
#    ('Paul', 'paul@upande.com'),
#    ('Kevin', 'kevin@upande.com'),
)

MANAGERS = ADMINS

#Let us try redis. Killing two birds with one stone. For result backend and also as the broker
#BROKER_URL = os.environ.get('CLOUDAMQP_URL')
CELERY_RESULT_BACKEND=os.environ['REDIS_URL']
BROKER_URL=os.environ['REDIS_URL']

STATICFILES_LOCATION = 'static'
STATICFILES_STORAGE = 'custom_storages.StaticStorage'
STATIC_URL = "https://%s/%s/" % (AWS_S3_CUSTOM_DOMAIN, STATICFILES_LOCATION)
