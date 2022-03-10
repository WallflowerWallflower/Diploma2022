import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';

export type DoctorType = {
  fullname: string;
  class: string; // type of doctor
  email: string;
  address?: {
    longitude: string;
    latitude: string;
  };
  rating: number;
  profileImgUrl?: string;
  additionalInfo: {
    about?: string;
    qualifications?: string[];
    services?: string[];
    reviews: ReviewType[];
    fees?: any;
  };
};

export type ReviewType = {
  username: string;
  comment: string;
  datePublish: Date;
};

@Component({
  selector: 'app-service-page',
  templateUrl: './service-page.component.html',
  styleUrls: ['./service-page.component.css']
})
export class ServicePageComponent implements OnInit {

  readonly url = 'http://localhost:4000/api'
  dataCard: any = [];
  index: any = this.dataCard.index;

  constructor(private http: HttpClient) { }

  ngOnInit(): void {
    this.http.get(`${this.url}/doctors`).subscribe(next => {
      this.dataCard = next;
      // console.log(this.dataCard)
    });
  }

}
