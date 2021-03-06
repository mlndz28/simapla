import { Injectable, ViewContainerRef } from '@angular/core';
import { Http, Response, URLSearchParams, Headers} from '@angular/http';
import { ToastsManager, Toast } from 'ng2-toastr';

import 'rxjs/add/operator/toPromise';

@Injectable()
export class httpService {

    private baseUrl = "http://localhost:1337/ws/";
    private options;

    constructor(public toastr: ToastsManager, vcr: ViewContainerRef, private http: Http) {
        this.toastr.setRootViewContainerRef(vcr);
        this.options = {
            headers: new Headers({ 'Authorization': 'Bearer ' + localStorage.getItem('token') })
        };
    }

    handleError(error){
      this.toastr.error(`Ha ocurrido un error de red`);
      console.debug(`ERROR: ${JSON.stringify(error)}`);
    }

	/**
	 * Do a GET request.
	 * @param url URL suffix.
	 * @param params Parameters to be attached to the URL.
	 * @returns Promise on server response.
	 */
    get(url, params, map): Promise<any> {
        console.log(this.options);
        return this.http.get(this.parseURL(url, params), this.options).toPromise()
        .then(
            response => response.json().data.map(this.mapResponse(map))
        )
        .catch(e => this.handleError(e));
    }

	/**
	 * Do a POST request.
	 * @param url URL suffix.
	 * @param body Parameters to be attached to the form.
	 * @returns Promise on server response.
	 */
    post(url, body, map): Promise<any> {
        return this.http.post(this.parseURL(url, {}), this.toURLSearchParams(body), this.options).toPromise()
        .then(
            response => response.json().data.map(this.mapResponse(map))
        )
        .catch(e => this.handleError(e));;
    }

	/**
	 * Do a DELETE request.
	 * @param url URL suffix.
	 * @param params Parameters to be attached to the URL.
	 * @returns Promise on server response.
	 */
    delete(url, params, map): Promise<any> {
        return this.http.delete(this.parseURL(url, params), this.options).toPromise()
        .then(
            response => response.json().data.map(this.mapResponse(map))
        )
        .catch(e => this.handleError(e));;
    }

	/**
	 * Do a PUT request.
	 * @param url URL suffix.
	 * @param body Parameters to be attached to the form.
	 * @returns Promise on server response.
	 */
    put(url, body, map): Promise<any> {
        return this.http.put(this.parseURL(url, {}), this.toURLSearchParams(body), this.options).toPromise()
        .then(
            response => response.json().data.map(this.mapResponse(map))
        )
        .catch(e => this.handleError(e));;
    }

	/**
	 * Gives format to an URL, appends parameters if any.
	 * @param suffix Schema information, the piece that goes after the common path for all requests.
	 * @param params Parameters to be attached to the URL.
	 * @returns Parsed URL.
	 */
    private parseURL(suffix, params) {
        if (suffix.slice(0, 1) == '/') { suffix = suffix.slice(1) };
        if (suffix.slice(-1) == '/') { suffix = suffix.slice(0, -1) };
        let urlParams = '?';
        for (var key in params) {
            urlParams += key + '=' + params[key] + '&';
        }
        urlParams = urlParams.slice(1);
        return this.baseUrl + suffix + urlParams;
    }

	/**
	 * Get an URLSearchParams out of a simple object with keys and values.
	 * @param body Form values.
	 * @returns A parsed params object ready to be used with angular/http.
	 */
    private toURLSearchParams(body) {
        let parsedBody = new URLSearchParams();
        for (var key in body) {
            parsedBody.set(key, body[key]);
        }
        return parsedBody;
    }

	/**
	 * Map an object by changing keys as needed.
	 * @param map Object that bounds the old labels with the new ones. It goes by "old":"new". Use an empty object to bypass this function.
	 * @returns Function with the object to be remapped as a parameter.
	 */
    private mapResponse(map) {
        return (obj) => {
            let mappedObject = {};
            for (var key in map) {
                mappedObject[map[key]] = obj[key];
            }
            return Object.keys(mappedObject).length ? mappedObject : obj;
        }
    }
}
