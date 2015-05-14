(function(angular) {
  'use strict';

  angular.module('OfferWall').controller('OfferWallController', function() {
    this.offers = [
      { title: 'Foo', payout: 42.0, thumbnail: { lowres: 'http://fc00.deviantart.net/fs71/f/2013/002/b/5/b59b8b8bb580b6efbaf5f5478346b701-d5q59m1.png' } },
      { title: 'Bar', payout: 37.0, thumbnail: { lowres: 'http://fc08.deviantart.net/fs71/f/2013/035/d/4/d4187401132494fdf7ac62c16e29604c-d5tszhb.png' } }
    ];
  });

})(angular);
