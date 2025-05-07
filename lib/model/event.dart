class Event{
  static String collectionName = 'Events';

  String? id;
  String? eventName;
  String? image;
  String? title;
  String? description;
  DateTime? date;
  String? time;
  bool isFavorite;

  Event({this.id = '',required this.title,
    required this.description, required this.eventName,
    required this.image, required this.date ,
    required this.time , this.isFavorite = false});

  //json => object
  Event.FromFireStore(Map<String, dynamic> data):this(
    id: data['id'],
    title: data['title'],
    description: data['description'],
    eventName: data['eventName'],
    image: data['image'],
    date: DateTime.fromMillisecondsSinceEpoch(data['date']),
    time: data['time'],
    isFavorite: data['isFavorite']
  );

  //object => json
  Map<String, dynamic>toFireStore(){
    return {
      'id' : id,
      'title' : title,
      'description' : description,
      'image' : image,
      'date' : date?.millisecondsSinceEpoch,
      'time' : time,
      'eventName' : eventName,
      'isFavorite' : isFavorite,

    };
  }

}