(function(angular) {
  'use strict';

  angular.module('OfferWall').service('OfferWallService', function($http) {
    return {
      baseUrl: '/offers',

      search: function(searchModel) {
        return $http.get(this.baseUrl, { params: searchModel });
      }
    };
  });

})(angular);
