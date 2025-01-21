class Event {
  // it's always better to have the attributes nullable just in case the user is messing around
  static const String collectionName = 'Events';
  String? id;
  String? title;
  String? description;
  String? image;
  String? eventName;
  String?
      time; // as fireStore has no TimeOfDay and we'll be formatting it as a string anyways
  DateTime? dateTime;
  bool? isFavorite;

  Event(
      {this.id = '', // cuz it'll be autoID
      required this.title,
      required this.description,
      required this.eventName,
      required this.dateTime,
      required this.image,
      this.isFavorite = false, // at creation it's not favorite yet
      required this.time});

  // object to json (as fireStore only understands json)
  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'eventName': eventName,
      'time': time,
      'dateTIme': dateTime
          ?.millisecondsSinceEpoch, // to store it as int not dateTime as there's no dateTime in fireStore
      'isFavorite': isFavorite
    };
  }

  //json => object
  Event.fromFireStore(
      Map<String, dynamic>
          data) // can make the data nullable (?) and that will make the (!) mark dispensable in firebase_utils line 9
      : this(
            // since dynamic, you can always type cast and it only helps the developer for clarity
            id: data['id'] as String,
            time: data['time'] as String,
            image: data['image'] as String,
            eventName: data['eventName'] as String,
            dateTime: DateTime.fromMillisecondsSinceEpoch(data['dateTIme']),
            description: data['description'],
            title: data['title'] as String,
            isFavorite: data['isFavorite'] as bool);
}
