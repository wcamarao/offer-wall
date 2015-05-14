(function(angular) {
  'use strict';

  angular.module('OfferWall').controller('OfferWallController', function(OfferWallService) {
    var ctrl = this;
    ctrl.searchModel = { uid: 'player1', page: 1 };
    ctrl.isLoading = false;
    search();

    ctrl.hasOffers = function() {
      return !!ctrl.totalOffersCount && !!ctrl.offers;
    };

    ctrl.hasPrev = function() {
      return ctrl.searchModel.page > 1;
    };

    ctrl.hasNext = function() {
      return ctrl.searchModel.page < ctrl.totalPages;
    };

    ctrl.prev = function() {
      ctrl.searchModel.page--;
      search();
    };

    ctrl.next = function() {
      ctrl.searchModel.page++;
      search();
    };

    ctrl.search = function() {
      ctrl.searchModel.page = 1;
      search();
    };

    ctrl.retry = function() {
      search();
    };

    function search() {
      var request = OfferWallService.search(ctrl.searchModel);
      ctrl.isLoading = true;

      request.success(function(response) {
        ctrl.offers = response.offers;
        ctrl.totalPages = response.pages;
        ctrl.totalOffersCount = response.count;
        ctrl.message = response.message;
      })

      request.error(function() {
        ctrl.offers = null;
        ctrl.totalPages = null;
        ctrl.totalOffersCount = null;
        ctrl.message = 'Something went wrong. Please try again later.';
      })

      request.finally(function() {
        ctrl.isLoading = false;
      });
    }
  });

})(angular);
