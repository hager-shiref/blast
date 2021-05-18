import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/blastn/blastn.dart';
import 'package:firebase_database/firebase_database.dart';
import 'output.dart';
 final db=FirebaseDatabase.instance;
   var retrevedData=" ";
   final ref=db.reference().child('data');
     final data=ref.child('description').once().then((DataSnapshot data){
         retrevedData=data.value;
       });
class SearchPage extends StatefulWidget {
  
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
   TextEditingController query = TextEditingController();
//    Future<void>_getdata()async{
      
//    }
//  Future blast()async{
//   Blast blast= Blast();
//  var q= await blast.blast(query.text.toString());
//   return Future.value(q);
// }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'BLASTn',
              style: TextStyle(color: Color(0xff4a707a)),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //mainAxisSize: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.20,
                    child: Image.asset('asstes/img6.png')),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 230,
                  ),
                  child: Text(
                    'Job Title',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    // textAlign: ,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(19),
                  child: TextFormField(
                    validator: (val) {
                      if (val == null || val.length == 0) {
                        return 'this field is required';
                      } else {
                        return null;
                      }
                    },
                    autocorrect: true,
                    decoration: InputDecoration(
                      focusColor: Colors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(19.0),
                  child: TextFormField(
                    controller:query ,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    autocorrect: true,
                    validator: (val) {
                      if (val == null || val.length == 0) {
                        return 'this field is required';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintText:
                          'Enter accession number(s),gi(s),or FASTA sequence(s)',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async{
                    retrevedData.isEmpty? CircularProgressIndicator():
                    //blast();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Output(query)));

                  },
                  child: Text(
                    'Search',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff4a707a)),
                    elevation: MaterialStateProperty.all(0),
                  ),
                ),
              ],
            ),
          ));
  }
}
