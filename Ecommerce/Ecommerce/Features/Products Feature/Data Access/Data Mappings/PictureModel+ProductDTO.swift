import Foundation

extension PictureModel {

    init(_ dto: ProductDTO.Picture) {
        self.init(id: dto.id,
                  url: dto.url,
                  secureUrl: dto.secureUrl,
                  size: dto.size,
                  maxSize: dto.maxSize,
                  quality: dto.quality)
    }
}
