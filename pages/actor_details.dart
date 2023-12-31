import 'package:flutter/material.dart';
import 'package:movie_app/network/response/actor_detail_response/actor_detail_response.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';
import '../data/models/movie_model.dart';
import '../data/models/movie_model_imp.dart';
import '../widgets/sliverappbar_widget.dart';
import '../widgets/table_row_widget.dart';
class ActorDetailScreen extends StatefulWidget {
  const ActorDetailScreen({Key? key,  this.actorID}) : super(key: key);
  final int? actorID;

  @override
  State<ActorDetailScreen> createState() => _ActorDetailScreenState();
}

class _ActorDetailScreenState extends State<ActorDetailScreen> {
  final MovieModel _movieModel = MovieModelImpl();
  ActorDetailResponse? actorDetail;
  @override
  void initState() {
    _movieModel.getActorDetailList(widget.actorID!).then((value) {
     setState(() {
       actorDetail = value;
     });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:  actorDetail == null ?const Center(child: CircularProgressIndicator(color: Colors.red,),):SliverAppBarWidget(expandedHeight: kPS400px, centerTitle: true, imageUrl: "https://image.tmdb.org/t/p/w500/${actorDetail?.profilePath}",
          body: SingleChildScrollView(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: kPS10px,right: kPS10px,top: kPS20px),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  const Text(kBiographyText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: kPS16px,color: Colors.white),),
                  const Divider(color: Colors.white,thickness: 2,),
                  const SizedBox(height: kPS10px,),
                  Text(actorDetail?.biography ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white70),textAlign: TextAlign.justify,),
                  const SizedBox(height: kPS10px,),
                  const Text(kMoreInfoText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                  const Divider(color: Colors.white,thickness: 2,),
                  CustomTable(
                    data: [
                      ['Place Of Birth','${actorDetail?.placeOfBirth}'],
                      ['BirthDay','${actorDetail?.birthday}'],
                      ['DeadDay','${actorDetail?.deathDay}'],
                      ['Gender',(actorDetail?.gender == 1?'female':'male')],
                      ['Popularity','${actorDetail?.popularity}'],
                    ],
                  ),
                  const SizedBox(height: kPS15px,),
                  /// KnowFor
                  const Text(kKnowForText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: kPS16px,color: Colors.white),),
                  // ListViewImage<MovieVO>(lisViewHeight: kPS260px,future: _movieModel.getPopularMoviesList(), itemBuilder: (context,movie){
                  //   return  Container(
                  //       width: kPS180px,
                  //       margin: const EdgeInsets.symmetric(horizontal: kPS15px,vertical: kPS15px),
                  //       child: StackWidget(width: 50,imageWidth:kPS180px,imageHeight:kPS260px,imageUrl: 'https://image.tmdb.org/t/p/w500/${movie?.backdropPath}', title:  movie?.title ?? "", voteAverage: "${movie?.voteAverage}", voteCount: "${movie?.voteCount}")
                  //   );
                  // }),
                ],),
            ),
          ),
      )
    );
  }
}
