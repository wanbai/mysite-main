'''
Created on 2013-6-26

@author: zhangyang
'''

from django.contrib.admin.models import User
from common.models import BaseModel
from django.db import models
import util
import re
from mysite.settings import STO_MEDIA
       
class Tag( BaseModel ):
    class Meta:
        db_table = 'ms_tags'
    
    articleNum = 0
    
    def setArticleNum(self, num):
        self.articleNum = num
        
    def __unicode__(self):
        return self.name
   
class Article( BaseModel ):
    class Meta:
        db_table = 'ms_articles'
        ordering = ['-create_at']
    
    user = models.ForeignKey( User, null=True )    
    content = models.TextField( null=False )
    tags = models.ManyToManyField( Tag )
    
    comment_num = 0
    
    def setCommentNum(self, num):
        self.comment_num = num
    
    def simpleContent(self):
        c = self.content
        if len(c) > 200:
            c = self.content[0:200]
        pattern = re.compile('<\/{0,}(div|br|pre|p|img)\s*((\S*=)".*"){0,}\/{0,}>')
        return pattern.sub('', c)
        
    @classmethod
    def saveArticle(cls, articleId, title, summary, tags, content, imgs = None):
        stags = tags.strip().lstrip().rstrip().split(',')
        tags =  [Tag.objects.get_or_create(name = tag)[0] for tag in stags]
        
        kwarg = {'name':title, 'desc':summary, 'content': content}
        if articleId:
            article = cls.objects.get(id = articleId)
            article.name = title
            article.tags = tags
            article.desc = summary
            article.content = content
        else:
            article = cls(**kwarg)
        
        if imgs is not None:
            for img in imgs:
                names = cls.saveFile(img, None)
                article.content = cls.changeContent(article.content.strip().lstrip().rstrip(), names)
        
        if articleId:
            pass
        else:
            article.save()
            article.tags = tags
        
        article.save()
        
        return article
    
    @classmethod
    def saveFile(cls, img, newname):
        if newname is None:
            newname = img._get_name()
        util.sae_save_file(img, 'media', newname)
        return [img._get_name(), newname]
    
    @classmethod
    def changeContent(cls, content, names):
        find = '##' + names[0] + '##'
        will = '<img src="' + STO_MEDIA + '' + names[1] + '" />'
        return content.replace(find, will)
        
class Comment( BaseModel ):
    class Meta:
        db_table = 'ms_comments'
    
    content = models.TextField( null=False )
    user = models.ForeignKey( User, null=True )
    article = models.ForeignKey( Article, null=True )
    komment = models.ForeignKey( 'self', null=True, related_name = 'comment_id' )
    root_komment = models.ForeignKey( 'self', null=True, related_name = 'root_comment_id' )
    
    def getComments(self):
        return Comment.objects.filter(root_komment_id = self.id)