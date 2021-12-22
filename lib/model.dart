

class Model{

  var title;
  var note;

  Model({
    this.title,
  this.note
  });


   // ignore: empty_constructor_bodies
   Model.fromMap(Map<String, dynamic> map){
    title = map['title'];
     note = map['note'];
   }

   Map<String, Object> toMap(){
    return{
      'title': title,
      'note': note
    };
   }
}