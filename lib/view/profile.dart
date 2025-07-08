import 'package:app_mvvm/data/response/status.dart';
import 'package:app_mvvm/utils/routes/routesName.dart';
import 'package:app_mvvm/utils/utils.dart';
import 'package:app_mvvm/view_model/movies_view_model.dart';
import 'package:app_mvvm/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final moviesViewModele=moviesViewModel();
    moviesViewModele.fetchMoviesApi();
  }
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<userViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
              userProvider.removeUser().then((val) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  routesName.home,
                      (route) => false,
                );
              });
            },
            child: Text('Logout',style: TextStyle(color: Colors.black),),
          ),
          SizedBox(width: 20,)
        ],
      ),
      body:Consumer<moviesViewModel>(builder: (context,value,_){
        switch(value.moviesList.status){
          case Status.LOADING:
            return Center(child: CircularProgressIndicator());
          case Status.ERROR:
            return Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Unable to Fetch Data"),
                SizedBox(height: 30,),
                InkWell(
                  onTap: (){
                    final movieprovider=Provider.of<moviesViewModel>(context,listen: false);
                    movieprovider.fetchMoviesApi();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                    color: Colors.grey,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.refresh,size: 40,),
                  ),
                )
              ],
            ));
          case Status.COMPELETED:
            return ListView.builder(itemCount: value.moviesList.data!.description!.length,itemBuilder:
                (context,index){
              return Card(
                child: ListTile(
                  title: Text(value.moviesList.data!.description![index].tITLE.toString()),
                  subtitle:Text(value.moviesList.data!.description![index].yEAR.toString()) ,
                  leading: Image.network(
                    value.moviesList.data!.description![index].iMGPOSTER.toString(),
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                                : null,

                        ),

                      );
                    },
                    errorBuilder: (context,value,stack){
                      return Icon(Icons.error,color: Colors.red,);
                    },
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                  trailing:Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(Utils.generateRandomDouble().toStringAsFixed(1),style: TextStyle(fontSize: 16,color: Colors.grey),),
                      Icon(Icons.star,color: Colors.yellow,)
                    ],
                  ) ,
                ),
              );
            });
          default:
            return Container();
        }

        }
        )
      );
  }
}
