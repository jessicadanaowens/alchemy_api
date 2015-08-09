angular.module('alchemyAPI').controller('analyzerCtrl', ['$scope',
  function ($scope) {

    $scope.showTwitterResults = false;

    $scope.showTwitterSentiments = function showTwitterSentiments () {
      $('#twitter-thinking').append('<h3> Thinking...please wait </h3>');

      $.get( "/twitter_sentiments", function( data ) {
      })
        .done(function (data) {
          var toResults =
            data["twitter"]["tweets_to_alchemy_api"]["positive"] + ', ' +
            data["twitter"]["tweets_to_alchemy_api"]["negative"] + ', ' +
            data["twitter"]["tweets_to_alchemy_api"]["neutral"];

          var taggedResults =
            data["twitter"]["tweets_tagged_alchemy_api"]["positive"] + ', ' +
            data["twitter"]["tweets_tagged_alchemy_api"]["negative"] + ', ' +
            data["twitter"]["tweets_tagged_alchemy_api"]["neutral"];

          var twitterToTotal = data["twitter"]["tweets_to_alchemy_api"]["total"];
          var twitterTaggedTotal = data["twitter"]["tweets_tagged_alchemy_api"]["total"];

          $('#twitter-results').append(
            '<h3>Twitter Results:</h3><ul>' + '<li>' + + twitterToTotal + ' tweets to @alchemyapi reveal: ' + toResults + '</li>' +
            '<li>' + twitterTaggedTotal + ' tweets tagged #alchemyapi reveal: ' +  taggedResults + '</li>' +
            '</ul>');

          $('div#twitter-thinking').remove();
        })
    }


    $scope.showStackOverflowSentiments = function showStackOverflowSentiments () {
      $('#stackoverflow-thinking').append('<h3> Thinking...please wait </h3>');

      $.get( "/stackoverflow_sentiments", function( data ) {
      })
        .done(function (data) {

          var stackoverflowTaggedResults =
            data["stackoverflow"]["tagged_alchemyapi"]["positive"] + ', ' +
            data["stackoverflow"]["tagged_alchemyapi"]["negative"] + ', ' +
            data["stackoverflow"]["tagged_alchemyapi"]["neutral"];

          var stackoverflowTotal = data["stackoverflow"]["tagged_alchemyapi"]["total"];

          $('#stackoverflow-results').append(
            '<h3>Stack Overflow Results:</h3><ul>' +
            '<li>' +  stackoverflowTotal + ' questions tagged #alchemyapi and corresponding answers and comments reveal: ' +  stackoverflowTaggedResults + '</li>' +
            '</ul>');

          $('div#stackoverflow-thinking').remove()
        })
    }
  }]);

