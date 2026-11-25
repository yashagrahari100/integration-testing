export declare const Type: {
    readonly ADD: 'ADD';
    readonly MUL: 'MUL';
};
export type Type = (typeof Type)[keyof typeof Type];
