(function(angular) {
  'use strict';

  angular.module('OfferWall').controller('OfferWallController', function(OfferWallService) {
    var ctrl = this;
    ctrl.searchModel = { uid: 'player1', page: 1 };
    ctrl.isLoading = false;
    ctrl.search = search;
    search();

    ctrl.hasOffers = function() {
      return !!ctrl.totalOffersCount && !!ctrl.offers;
    };

    function search() {
      var request = OfferWallService.search(ctrl.searchModel);
      ctrl.isLoading = true;

      request.success(function(response) {
        ctrl.offers = response.offers;
        ctrl.totalOffersCount = response.count;
      })

      request.error(function() {
        ctrl.offers = null;
        ctrl.totalOffersCount = null;
      })

      request.finally(function() {
        ctrl.isLoading = false;
      });
    }
  });

})(angular);
