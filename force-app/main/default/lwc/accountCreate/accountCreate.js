import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateAccountRecord extends LightningElement {
    recordId;
    createAccount(event)
    {
        this.recordId=event.detail.id;
        const showSuccess = new ShowToastEvent({title:'success', message:'Account is Created successfully :'+this.recordId, variant:'success'});
        this.dispatchEvent(showSuccess);
    }

}