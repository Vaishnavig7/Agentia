import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
 
 
 
export default class Navigation extends NavigationMixin(LightningElement) {
    navigateAccObject(){
        this[NavigationMixin.Navigate]({
                type: 'standard__objectPage',
                attributes: {
                    objectApiName: 'Account',
                    actionName: 'home'
        },
    });
}
 
navigateConObject(){
    this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Contact',
                actionName: 'home'
    },
});
}
navigateWebPage(){
    this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            attributes: {
                url: "https://www.google.com"
    },
});
}
 
}