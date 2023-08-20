import 'package:movie_app/constant/api_constant.dart';
import 'package:movie_app/network/response/actor_detail_response/actor_detail_response.dart';
import 'package:movie_app/network/response/moviedetails_response/movie_details_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../response/actor_response/actor_response.dart';
import '../response/genres_response/genres_response.dart';
import '../response/movie_response/movie_response.dart';
part 'movie_api.g.dart';
@RestApi(baseUrl: kMovieBaseURL)
abstract class MovieApi{
 factory MovieApi(Dio dio) = _MovieApi;
///Genres
 @GET(kGenresEndPoint)
 Future<GenresResponse> getGenresResponse(@Query(kQueryParamsApiKey) String apiKey,);
///NowPlaying
 @GET(kGetNowPlayingMoviesEndPoint)
 Future<MovieResponse> getNowPlayingMovieResponse(
     @Query(kQueryParamsApiKey) String apiKey,
     );
///TopRated
 @GET(kGetTopRatedEndPoint)
 Future<MovieResponse> getTopRatedResponse(
     @Query(kQueryParamsApiKey) String apiKey,);
///PopularMovies
  @GET(kPopularMoviesEndPoint)
 Future<MovieResponse> getPopularMoviesResponse(
     @Query(kQueryParamsApiKey) String apiKey,);
///Actor
  @GET(kGetActorEndPoint)
 Future<ActorResponse> getActorResponse(
     @Query(kQueryParamsApiKey) String apiKey,);
///ActorDetail
  @GET(kGetActorDetailEndPoint)
 Future<ActorDetailResponse> getActorDetailResponse(
     @Query(kQueryParamsApiKey) String apiKey,
     @Path(kPathParameterMovieID) int movieID
      );
  ///MovieDetail
 @GET(kGetMovieDetailsEndPoint)
 Future<MovieDetailsResponse> getMovieDetailsResponse(
     @Query(kQueryParamsApiKey) String apiKey,
     @Path(kPathParameterMovieID) int movieID);
}
