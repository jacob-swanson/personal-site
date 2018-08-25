import * as React from "react";
import avatar from "./avatar.png";
import "./HomePage.css";
import {Page} from "../../components/page/Page";

export const HomePage = () => (
    <Page className="has-background-link" title="Jacob Swanson - Home">
        <section className="hero is-link is-large">
            <div className="hero-body">
                <div className="container has-text-centered">
                    <h1 className="title is-spaced is-size-1">Jacob Swanson</h1>
                    <h2 className="subtitle">
                        Hi! I'm a software engineer living and working in Austin, Texas.
                        <br/>
                        <br/>
                        <div className="level">
                            <div className="level-item">
                                <figure className="image is-256x256">
                                    <img src={avatar}/>
                                </figure>
                            </div>
                        </div>
                    </h2>
                </div>
            </div>
        </section>
    </Page>
);