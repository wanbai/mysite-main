from django.conf.urls import patterns, url

urlpatterns = patterns('',
    url(r'^save/$', 'article.views.saveArticle'),
    url(r'^query/$', 'article.views.showArticleList'),
    url(r'^([1-9]\d*)/$', 'article.views.showArticle'),
    url(r'^remove/$', 'article.views.removeArticle'),
    
    url(r'^feed/save/$','article.views.saveComment'),
    url(r'^feeds','article.views.showFeeds')
)