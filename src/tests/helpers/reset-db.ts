
import { prisma } from "../../lib/prisma.js"

export default async () => {
  await prisma.$transaction([
    prisma.request.deleteMany(),
  ])
}