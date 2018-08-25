export function classNames(...args: Array<string | { [className: string]: boolean | null | undefined } | string[] | null | undefined>): string {
    const classes = [];

    for (const arg of args) {
        if (!arg) {
            continue;
        }

        const argType = typeof arg;

        if (argType === "string") {
            classes.push(arg);
        } else if (Array.isArray(arg) && arg.length) {
            const innerClassNames = classNames(arg);
            classes.push(innerClassNames);
        } else if (argType === "object") {
            for (const [key, value] of Object.entries(arg)) {
                if (value) {
                    classes.push(key);
                }
            }
        }
    }

    return classes.join(" ");
}