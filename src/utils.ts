export function stripDate(postId: string): string {
    return postId.replace(/^\d{4}-\d{2}-\d{2}-/, "")
}