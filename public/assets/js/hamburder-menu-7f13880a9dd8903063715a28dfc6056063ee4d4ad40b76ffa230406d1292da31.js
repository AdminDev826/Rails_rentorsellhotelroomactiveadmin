//intialize the map
define(['knockout', 'komapping'], function(ko, komapping) {
    ko.mapping = komapping;

    function HamburgerMenuViewModel(params) {
        var self = this;

        self.root = params;
        self.mobileMenu = ko.observable(false);
        self.menus = getMenus();
        self.menuOptions = [];
        self.userMenuOptions = [];

        for(var m = 0; m < self.menus.length; m++) {
            if (self.menus[m].roles == null)
                self.menuOptions.push(self.menus[m]);
            else {
                for (var r = 0; r < window.currentUser.roles.length; r++) {
                    if (self.menus[m].roles.indexOf(window.currentUser.roles[r]) >= 0) {
                        self.userMenuOptions.push(self.menus[m]);
                        r = window.currentUser.roles.length;
                    }
                }
            }
        }

        self.menuClick = function(data) {
            if (data.path) {
                history.pushState(data, data.page, data.path);
                ga('send', 'pageview', data.path);
                trackNavigation();
            }
            if (data.query)
                self.root.query(data.query);
            if (data.page) {
                if (self.root.page() == data.page)
                    self.root.page(null);
                self.root.page(data.page);
                if (self.root.page() == 'crm-page')
                    self.root.performSearch();
            }
            self.mobileMenu(false);
        };

        self.mobileMenuClick = function() {
            if (self.root.isPortrait()) {
                self.mobileMenu(!self.mobileMenu());
            }
        };
    };

    return HamburgerMenuViewModel;

});


function hamburgerToggle() {
    var x = document.getElementById('mobile_menu');
    if (x.style.display === 'none') {
        x.style.display = 'block';
    } else {
        x.style.display = 'none';
    }
}
;
