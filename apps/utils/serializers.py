from rest_framework import serializers
from apps.utils.models import Channel,Feed

class ChannelSerializer(serializers.ModelSerializer):
    feeds = serializers.PrimaryKeyRelatedField(many=True, read_only=True)
    class Meta:
        model = Channel
        fields = ('id', 'data_id', 'name', 'description', 'latitude', 'longitude','created_at','updated_at','elevation','last_entry_id','username','field1','field2','field3','field4','field5','field6','field7','field8','feeds')


class FeedSerializer(serializers.ModelSerializer):
    channel = serializers.PrimaryKeyRelatedField(many=True, read_only=True)
    class Meta:
        model = Feed
        fields = ('id','entry_id','channel','field1','field2','field3','field4','field5','field6','field7','field8')


"""
class ChannelSerializer(serializers.Serializer):
    id = serializers.IntegerField(read_only=True)
    data_id = serializers.IntegerField(read_only=True)
    name = serializers.TextField()
    description = models.TextField()
    latitude  = serializers.FloatField()
    longitude  = serializers.FloatField()
    created_at = serializers.DateTimeField()
    updated_at = serializers.DateTimeField()
    elevation = serializers.TextField()
    last_entry_id = serializers.IntegerField()
    username = serializers.TextField()

    #For speed, I shall make this table not fully normalized. We shall have fields 1-9. Not very scalable but easily queried                                                                    
    field1 = serializers.TextField(required=False, allow_blank=True, max_length=100)
    field2 = serializers.TextField(required=False, allow_blank=True, max_length=100)
    field3 = serializers.TextField(required=False, allow_blank=True, max_length=100)
    field4 = serializers.TextField(required=False, allow_blank=True, max_length=100)
    field5 = serializers.TextField(required=False, allow_blank=True, max_length=100)
    field6 = serializers.TextField(required=False, allow_blank=True, max_length=100)
    field7 = serializers.TextField(required=False, allow_blank=True, max_length=100)
    field8 = serializers.TextField(required=False, allow_blank=True, max_length=100)

    def create(self, validated_data):
       '''
        Create and return a new `Channel` instance, given the validated data.
       '''
        return Channel.objects.create(**validated_data)
 
class FeedSerializer(serializers.Serializer):
    id = serializers.IntegerField(read_only=True)
    entry_id = serializers.IntegerField(read_only=True)
    channel = serializers.ForeignKeyField()

    #For speed, I shall make this table not fully normalized. We shall have fields 1-9. Not very scalable but easily queried                                                                    
    field1 = serializers.FloatField(required=False, allow_blank=True)
    field2 = serializers.FloatField(required=False, allow_blank=True)
    field3 = serializers.FloatField(required=False, allow_blank=True)
    field4 = serializers.FloatField(required=False, allow_blank=True)
    field5 = serializers.FloatField(required=False, allow_blank=True)
    field6 = serializers.FloatField(required=False, allow_blank=True)
    field7 = serializers.FloatField(required=False, allow_blank=True)
    field8 = serializers.FloatField(required=False, allow_blank=True)

    def create(self, validated_data):
        '''
        Create and return a new `Feed` instance, given the validated data.
        '''
        return Feed.objects.create(**validated_data)
"""
