import * as React from "react";
import {Page} from "../components/page/Page";

export const NotFoundPage = () => (
    <Page title="Jacob Swanson - Not Found">
        <section className="hero is-large">
            <div className="hero-body">
                <div className="container has-text-centered">
                    <h1 className="title is-spaced is-size-1">Page not found</h1>
                    Take me back to <a href="/">jacob-swanson.com</a>
                </div>
            </div>
        </section>
    </Page>
);