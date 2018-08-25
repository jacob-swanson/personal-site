import * as React from "react";
import {Page} from "../components/page/Page";
import {Link} from "react-router-dom";

export const NotFoundPage = () => (
    <Page title="Jacob Swanson - Not Found">
        <section className="hero is-large">
            <div className="hero-body">
                <div className="container has-text-centered">
                    <h1 className="title is-spaced is-size-1">Page not found</h1>
                    Take me back to <Link to="/">jacob-swanson.com</Link>
                </div>
            </div>
        </section>
    </Page>
);