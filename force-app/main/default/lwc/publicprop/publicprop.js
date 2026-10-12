import { LightningElement ,api } from 'lwc';

export default class Publicprop extends LightningElement {

    message = 'Private Property';
    @api recordId;
}